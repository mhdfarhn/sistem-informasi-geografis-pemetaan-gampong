@extends('layouts.app')

@section('content')
<div class="bg-white py-4">
  <div class="container">

    {{-- Title --}}
    <div class="mb-4 text-center">
      <h1 class="h3">Pemetaan Gampong</h1>
    </div>

    {{-- Maps --}}
    <div id="map" style="height: 400px;" class="mb-4"></div>

    <hr>

    {{-- Title --}}
    <div class="mb-4 text-center">
      <h1 class="h5">Daftar Gampong</h1>
    </div>

    <table class="table table-bordered table-stripped">
      <thead class="text-center">
        <tr>
          <th>No</th>
          <th>Gampong</th>
          <th>Kecamatan</th>
          <th>Website</th>
        </tr>
      </thead>
      <tbody>
        @foreach ($villages as $village)
        <tr>
          <td scope="row" class="text-center">{{ $loop->iteration }}</td>
          <td>{{ $village->name }}</td>
          <td class="text-center">{{ $village->district }}</td>
          <td class="text-center"><a target="_blank" href="http://{{ $village->site }}">{{ $village->site }}</a></td>
        </tr>
        @endforeach
      </tbody>
    </table>

  </div>

</div>
@endsection

@push('js')
{{-- Mapbox --}}
<script>
  mapboxgl.accessToken = '{{ env('MAPBOX_KEY')  }}'
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [97.9730831, 4.4746338],
      zoom: 11,
    })

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

    const customData = {!! $geoJson !!}

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
    
    loadLocations(customData)

    map.addControl(geocoder)
    map.addControl(new mapboxgl.NavigationControl())

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

    geocoder.on('result', (event) => {
      createPopUp(event.result)
    })
</script>
@endpush