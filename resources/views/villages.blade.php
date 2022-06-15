@extends('layouts.app')

@section('content')
<div class="bg-white py-4">
  <div class="container">

    {{-- Title --}}
    <div class="mb-4 text-center">
      <h1 class="h3">Pemetaan Gampong</h1>
    </div>

    {{-- Maps --}}
    {{-- <div class="row"> --}}
      <div id="map" style="height: 400px;" class="mb-4 position-relative"></div>
      {{-- <div style="height: 400px;" class="col-2 border text-center">
        <h6 class="text-center mt-3">Pemetaan Gampong</h6>
        <hr>
        <div id="listings"></div>
        <button type="button" class="btn btn-dark" id="baro">Gampong Baro</button>
      </div> --}}
      {{--
    </div> --}}

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

  // // Baro
  // map.addSource('baro', {
  //   'type': 'geojson',
  //   'data': {
  //     'type': 'Feature',
  //     'geometry': {
  //       'type': 'Polygon',
  //       // These coordinates outline Maine.
  //       'coordinates': [
  //         [
  //           [97.97622985621754, 4.460672491919002],
  //           [97.97710059456669, 4.461838050379202],
  //           [97.97730798703785, 4.4619523786765205],
  //           [97.9791870498509, 4.46451043753472],
  //           [97.98153848071826, 4.462733883494449],
  //           [97.98145915215672, 4.462621335098518],
  //           [97.98190773816478, 4.4623850086242705],
  //           [97.98200969069576, 4.462497945819029],
  //           [97.98279982281072, 4.461989728305845],
  //           [97.98275451057472, 4.461820322389938],
  //           [97.9834341942394, 4.461422218320832],
  //           [97.98291593548585, 4.460583657980855],
  //           [97.98114592620475, 4.460329548605982],
  //           [97.98067014772694, 4.460414251740762],
  //           [97.98053137900423, 4.460507425177743],
  //           [97.98054270706324, 4.460501778303103],
  //           [97.98025100943573, 4.4598072123810075],
  //           [97.97917201168303, 4.4599540312515815],
  //           [97.97824311084537, 4.460363429855159],
  //           [97.97801654966545, 4.460052851625059],
  //           [97.97778149232835, 4.460131907922093],
  //           [97.97768520382688, 4.459993559410385],
  //           [97.97743315451422, 4.460261786093049],
  //           [97.97622954809009, 4.460668361095953]
  //         ]
  //       ]
  //     }
  //   }
  // });
  
  // function btnBaro() {
  //   // Add a new layer to visualize the polygon.
  //   map.addLayer({
  //     'id': 'maine',
  //     'type': 'fill',
  //     'source': 'maine', // reference the data source
  //     'layout': {},
  //     'paint': {
  //       'fill-color': '#0080ff', // blue color fill
  //       'fill-opacity': 0.5
  //     }
  //   });
  //   // Add a black outline around the polygon.
  //   map.addLayer({
  //     'id': 'outline',
  //     'type': 'line',
  //     'source': 'maine',
  //     'layout': {},
  //     'paint': {
  //       'line-color': '#000',
  //       'line-width': 3
  //     }
  //   });
  // }

  // const element = document.getElementById("baro")
  // element.addEventListener("click", btnBaro)
  
  // customData.features.forEach((data, i) => {
  //   data.properties.id = i;
  // });

  // map.on('load', () => {
  //   // map.addSource('places', {
  //   //   'type': 'geojson',
  //   //   'data': customData
  //   // })
  //   map.addSource('gpbaro', {
  //     'type': 'geojson',
  //     'data': {
  //       'type': 'Feature',
  //       'geometry': {
  //         'type': 'Polygon',
  //         // These coordinates outline Maine.
  //         'coordinates': [
  //           [
  //             [97.97622985621754, 4.460672491919002],
  //             [97.97710059456669, 4.461838050379202],
  //             [97.97730798703785, 4.4619523786765205],
  //             [97.9791870498509, 4.46451043753472],
  //             [97.98153848071826, 4.462733883494449],
  //             [97.98145915215672, 4.462621335098518],
  //             [97.98190773816478, 4.4623850086242705],
  //             [97.98200969069576, 4.462497945819029],
  //             [97.98279982281072, 4.461989728305845],
  //             [97.98275451057472, 4.461820322389938],
  //             [97.9834341942394, 4.461422218320832],
  //             [97.98291593548585, 4.460583657980855],
  //             [97.98114592620475, 4.460329548605982],
  //             [97.98067014772694, 4.460414251740762],
  //             [97.98053137900423, 4.460507425177743],
  //             [97.98054270706324, 4.460501778303103],
  //             [97.98025100943573, 4.4598072123810075],
  //             [97.97917201168303, 4.4599540312515815],
  //             [97.97824311084537, 4.460363429855159],
  //             [97.97801654966545, 4.460052851625059],
  //             [97.97778149232835, 4.460131907922093],
  //             [97.97768520382688, 4.459993559410385],
  //             [97.97743315451422, 4.460261786093049],
  //             [97.97622954809009, 4.460668361095953]
  //           ]
  //         ]
  //       }
  //     }
  //   });

  //   // buildLocationList(customData)

  //   const btnBaro = document.getElementById('baro')

  //   btnBaro.addEventListener('click', function() {
  //     map.addLayer({
  //       'id': 'gpbaro',
  //       'type': 'fill',
  //       'source': 'gpbaro', // reference the data source
  //       'layout': {},
  //       'paint': {
  //         'fill-color': '#0080ff', // blue color fill
  //         'fill-opacity': 0.5
  //       }
  //     });
  //     // Add a black outline around the polygon.
  //     map.addLayer({
  //       'id': 'outline',
  //       'type': 'line',
  //       'source': 'gpbaro',
  //       'layout': {},
  //       'paint': {
  //         'line-color': '#000',
  //         'line-width': 3
  //       }
  //     });
  //   })
  // })

  // function buildLocationList(customData) {
  //   for (const data of customData.features) {
  //     const listings = document.getElementById('listings')
  //     const listing = listings.appendChild(document.createElement('div'))

  //     listing.id = `listing-${data.properties.id}`
  //     listing.className = 'item'
  //     const link = listing.appendChild(document.createElement('a'));
  //     link.href = '#';
  //     link.id = `link-${data.properties.id}`;
  //     link.innerHTML = `${data.properties.name}`;

  //     link.addEventListener('click', function() {
  //       for (const feature of customData.features) {
  //         if (this.id === `link.${feature.properties.id}`) {
  //           flyToStore(feature)
  //         }
  //       }
  //     })
  //   }
  // }

  // function flyToStore(currentFeature) {
  //   map.flyTo({
  //     center: currentFeature.geometry.coordinates,
  //     zoom: 15
  //   });
  // }

  const myCustomControl = new MyCustomControl();

  map.addControl(new mapboxgl.NavigationControl())
  map.addControl(myCustomControl);

  class MyCustomControl {
    onAdd(map){
      this.map = map;
      this.container = document.createElement('div');
      this.container.className = 'my-custom-control';
      const button = this._createButton('pemetaan')
      this.container.appendChild(button)
      return this.container;
    }

    onRemove(){
      this.container.parentNode.removeChild(this.container);
      this.map = undefined;
    }
    
    _createButton(className) {
      const el = window.document.createElement('button')
      el.className = className;
      el.id = 'buttonPeta';
      el.textContent = 'Pemetaan';
      el.addEventListener('click', (e) => {
        // console.log('tes');
        drawPolygon(e);
      }, false )
      return el;
    }

    // function drawPolygon(e) {
    //   map.on('load', () => {
    //   map.addSource('gpbaro', {
    //     'type': 'geojson',
    //     'data': {
    //       'type': 'Feature',
    //       'geometry': {
    //         'type': 'Polygon',
    //         'coordinates': [
    //           [
    //             [97.97622985621754, 4.460672491919002],
    //             [97.97710059456669, 4.461838050379202],
    //             [97.97730798703785, 4.4619523786765205],
    //             [97.9791870498509, 4.46451043753472],
    //             [97.98153848071826, 4.462733883494449],
    //             [97.98145915215672, 4.462621335098518],
    //             [97.98190773816478, 4.4623850086242705],
    //             [97.98200969069576, 4.462497945819029],
    //             [97.98279982281072, 4.461989728305845],
    //             [97.98275451057472, 4.461820322389938],
    //             [97.9834341942394, 4.461422218320832],
    //             [97.98291593548585, 4.460583657980855],
    //             [97.98114592620475, 4.460329548605982],
    //             [97.98067014772694, 4.460414251740762],
    //             [97.98053137900423, 4.460507425177743],
    //             [97.98054270706324, 4.460501778303103],
    //             [97.98025100943573, 4.4598072123810075],
    //             [97.97917201168303, 4.4599540312515815],
    //             [97.97824311084537, 4.460363429855159],
    //             [97.97801654966545, 4.460052851625059],
    //             [97.97778149232835, 4.460131907922093],
    //             [97.97768520382688, 4.459993559410385],
    //             [97.97743315451422, 4.460261786093049],
    //             [97.97622954809009, 4.460668361095953]
    //           ]
    //         ]
    //       }
    //     }
    //   });

    //   map.addLayer({
    //     'id': 'gpbaro',
    //     'type': 'fill',
    //     'source': 'gpbaro', // reference the data source
    //     'layout': {},
    //     'paint': {
    //       'fill-color': '#0080ff', // blue color fill
    //       'fill-opacity': 0.5
    //     }
    //   });

    //   map.addLayer({
    //     'id': 'outline',
    //     'type': 'line',
    //     'source': 'gpbaro',
    //     'layout': {},
    //     'paint': {
    //       'line-color': '#000',
    //       'line-width': 3
    //     }
    //   });
    //   })
    // }
  }
</script>
@endpush