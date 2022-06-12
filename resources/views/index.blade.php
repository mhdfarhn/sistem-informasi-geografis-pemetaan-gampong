@extends('layouts.app')

@section('content')
{{-- Header Image
<img src="{{  asset('img/header-img.jpg')  }}" class="img-fluid" alt="dpmg-langsa"> --}}

{{-- Map Section --}}
<section class="bg-white py-2" id="villages">
  <div class="container">
    <div class="text-center py-4">
      {{-- <h3 class="text-uppercase"><a href="{{ Nav::isRoute('villages') }}" class="text-dark">Pemetaan Gampong</a>
      </h3> --}}
      <h3 class="text-uppercase">Pemetaan Gampong</h3>
      <h5 class="section-subheading text-muted">Dinas Pemberdayaan Masyarakat dan Gampong Kota Langsa</h5>
    </div>
    <div class="container pb-4">
      <div id="map" style="height: 400px;" class="mb-4"></div>
    </div>
  </div>
</section>

{{-- Profile Section --}}
<section class="py-4" id="profiles">
  <div class="container">
    <div class="text-center py-4">
      <h3 class="text-uppercase"><a href="{{ Nav::isRoute('profile') }}" class="text-dark">Profil</a></h3>
      <h5 class="section-subheading text-muted">Profil singkat dinas pemberdayaan masyarakat dan gampong kota langsa
      </h5>
      <div class="row justify-content-center">
        <div class="col-md-6">
          <p>
            {!! $profiles[0]->general !!}
          </p>
        </div>
      </div>
    </div>
  </div>
</section>

{{-- News Section --}}
<section class="bg-white py-4" id="news">
  <div class="container">
    <div class="text-center py-4">
      <h3 class="text-uppercase"><a href="{{ Nav::isRoute('posts') }}" class="text-dark">Berita</a></h3>
      <h5 class="section-subheading text-muted">Berita terbaru mengenai Dinas Pemberdayaan Masyarakat dan Gampong Kota
        Langsa</h5>
    </div>
    <div class="container py-4">
      <div class="row">
        @foreach ($posts->take(3) as $post)
        <div class="col-md-4 mb-4">
          <div class="card rounded-0">
            <div style="max-height: 400; overflow: hidden;">
              <img src="{{ asset('storage/' . $post->image) }}" alt="{{ $post->slug . '-img'  }}"
                class="card-img-top rounded-0">
            </div>
            <div class="card-body">
              <h1 class="card-title h5"><a href="/posts/{{ $post->slug }}">{{ $post->title }}</a></h1>
              <p class="text-muted">{{ $post->created_at->diffForHumans() }}</p>
              <p class="card-text">{{ $post->excerpt }}</p>
              <a href="/posts/{{ $post->slug }}" class="btn btn-primary">Selengkapnya</a>
            </div>
          </div>
        </div>
        @endforeach
      </div>
    </div>
  </div>
</section>

{{-- Village Section
<section class="bg-white py-4" id="village">
  <div class="container">
    <div class="text-center py-4">
      <h3 class="text-uppercase">Alamat</h3>
      <h5 class="section-subheading text-muted">Berita terbaru mengenai Dinas Pemberdayaan Masyarakat dan Gampong Kota
        Langsa</h5>
    </div>

    <iframe class="justify-content-center"
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7955.359550010882!2d97.95929297804835!3d4.470484170367691!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30379b2c36ba7715%3A0x4a9da539fdc69a89!2sKantor%20Badan%20Pemberdayaan%20Masyarakat%20Kota%20Langsa!5e0!3m2!1sid!2sid!4v1642556508010!5m2!1sid!2sid"
      height="400" width="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
  </div>
</section> --}}
@endsection

@push('js')
{{-- Mapbox --}}
<script>
  mapboxgl.accessToken = '{{ env('MAPBOX_KEY')  }}'
  // Map
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [97.9730831, 4.4746338],
    zoom: 11,
  })

  // Add marker and pop up to map
  const loadLocations = (geoJson) => {
    geoJson.features.forEach((location) => {
      const {geometry, properties} = location
      const {locationId, name, district, image, office_address, site} = properties
      let markerElement = document.createElement('div')
      markerElement.className = 'marker' + locationId
      markerElement.id = locationId
      markerElement.style.backgroundImage = 'url(https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678111-map-marker-512.png)'
      markerElement.style.backgroundSize = 'cover'
      markerElement.style.width = '25px'
      markerElement.style.height = '25px'

      const content = `
          <div style="overflow-y, auto; max-height: 400px, width: 100%">
              <table class="table table-sm mt-2">
                  <tbody>
                      <tr>
                          <td>Gampong</td>
                          <td>${name}</td>
                      </tr>
                      <tr>
                          <td>Kecamatan</td>
                          <td>${district}</td>
                      </tr>
                      <tr>
                          <td>Kantor</td>
                          <td><img src=${image} alt='' style='max-height: 150px;'></td>
                      </tr>
                      <tr>
                          <td>Alamat Kantor</td>
                          <td>${office_address}</td>
                      </tr>
                      <tr>
                          <td>Situs Web</td>
                          <td><a target="_blank" href="http://${site}">${site}</a></td>
                      </tr>
                  </tbody>
              </table>
          </div>
      `

      const popUp = new mapboxgl.Popup({
          offset: 25
      }).setHTML(content).setMaxWidth('400px')

      new mapboxgl.Marker(markerElement).setLngLat(geometry.coordinates).setPopup(popUp).addTo(map)
    })
  }

  const customData = {!! $geoJson !!}

  // Geocoder
  const geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl,
    localGeocoder: forwardGeocoder,
    marker: false,
    placeholder: 'Cari Gampong',
    bbox: [97.88604722512781, 4.420537404621868, 98.08481587481185, 4.577306505168792],
    proximity: {
      longitude: 97.9730831, 
      latitude: 4.4746338
    }
  })

  // Search for local database
  function forwardGeocoder(query) {
    const matchingFeatures = []
    for (const feature of customData.features) {
      if (feature.properties.name.toLowerCase().includes(query.toLowerCase())
      ) {
        feature['place_name'] = `🌲 ${feature.properties.name}`
        feature['center'] = feature.geometry.coordinates
        feature['place_type'] = ['village']
        matchingFeatures.push(feature)
      }
    }
    return matchingFeatures
  }
  
  // Create pop up for match location
  function createPopUp(currentFeature) {
    const popUps = document.getElementsByClassName('mapboxgl-popup');
    if (popUps[0]) popUps[0].remove();
    const popup = new mapboxgl.Popup({ closeOnClick: false })
    .setLngLat(currentFeature.geometry.coordinates)
    .setHTML(`
        <h6>Gampong ${currentFeature.properties.name}</h6>
        <hr>
        <p>Kecamatan: ${currentFeature.properties.district}</p>
        <p>Alamat Kantor: ${currentFeature.properties.office_address}</p>
        <p>Koordinat: ${currentFeature.geometry.coordinates}</p>
    `
    )
    .setMaxWidth('400px')
    .addTo(map);
  }

  // Open pop up for match location
  geocoder.on('result', (event) => {
    createPopUp(event.result)
  })

  loadLocations(customData)

  map.addControl(geocoder)
  map.addControl(new mapboxgl.NavigationControl())
</script>
@endpush