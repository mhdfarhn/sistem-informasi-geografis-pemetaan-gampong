@extends('layouts.admin')

@section('main-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">{{ $title ?? __('Blank Page') }}</h1>

    <!-- Main Content goes here -->

    <div class="card">
        <div class="card-body">
            <form action="{{ route('villages.store') }}" method="post" enctype="multipart/form-data">
                @csrf

                <div class="form-group">
                  <label for="name">Nama Gampong</label>
                  <input type="text" class="form-control @error('name') is-invalid @enderror" name="name" id="name" autocomplete="off" value="{{ old('name') }}" required autofocus>
                  @error('name')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <div class="form-group">
                  <label for="district">Kecamatan</label>
                  <input type="text" class="form-control @error('district') is-invalid @enderror" name="district" id="district" autocomplete="off" value="{{ old('district') }}" required autofocus>
                  @error('district')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <div class="form-group">
                  <label for="image">Foto Kantor</label>
                  <img class="img-preview img-fluid col-sm-4 mb-2">
                  <input type="file" class="form-control @error('image') is-invalid @enderror" name="image" id="image" onchange="previewImage()">
                  @error('image')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>


                <div class="form-group">
                  <label for="office_address">Alamat Kantor</label>
                  <input type="text" class="form-control @error('office_address') is-invalid @enderror" name="office_address" id="office_address" autocomplete="off" value="{{ old('office_address') }}" required autofocus>
                  @error('office_address')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <div class="form-group">
                  <label for="site">Situs Web</label>
                  <input type="text" class="form-control @error('site') is-invalid @enderror" name="site" id="site" autocomplete="off" value="{{ old('site') }}" required autofocus>
                  @error('site')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="long">Longitude</label>
                      <input type="text" class="form-control @error('long') is-invalid @enderror" name="long" id="long" autocomplete="off" value="{{ old('long') }}" required autofocus>
                      @error('long')
                        <span class="text-danger">{{ $message }}</span>
                      @enderror
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="lat">Latitude</label>
                      <input type="text" class="form-control @error('lat') is-invalid @enderror" name="lat" id="lat" autocomplete="off" value="{{ old('lat') }}" required autofocus>
                      @error('lat')
                        <span class="text-danger">{{ $message }}</span>
                      @enderror
                    </div>
                  </div>
                </div>

                <div class="row mb-4">
                  <div class="col-lg-6">
                    <div class="card">
                      <div class="card-header">Map</div>
                      <div class="card-body px-0 py-0">
                        <div id="map" style="height: 200px;"></div>
                      </div>
                    </div>
                  </div>
                </div>

                <button type="submit" class="btn btn-primary">Tambah</button>
                <a href="{{ route('villages.index') }}" class="btn btn-default">Kembali ke daftar Gampong</a>

            </form>
        </div>
    </div>
  
  <!-- End of Main Content -->
@endsection

@push('notif')
  @if (session('success'))
      <div class="alert alert-success border-left-success alert-dismissible fade show" role="alert">
          {{ session('success') }}
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
          </button>
      </div>
  @endif

  @if (session('status'))
      <div class="alert alert-success border-left-success" role="alert">
          {{ session('status') }}
      </div>
  @endif
@endpush

@push('js')
  <script>
    // Mapbox
    const defaultLocation = [97.9730831, 4.4746338];

    mapboxgl.accessToken = '{{ env('MAPBOX_KEY')  }}';
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: defaultLocation,
      zoom: 11,
    });
    
    map.addControl(new mapboxgl.NavigationControl());

    map.on('click', (e) => {
      const longitude = e.lngLat.lng
      const latitude = e.lngLat.lat
      
      document.getElementById('long').value = e.lngLat.lng
      document.getElementById('lat').value = e.lngLat.lat
    });

    // Image Preview
    function previewImage() {
        const image = document.querySelector('#image');
        const imgPreview = document.querySelector('.img-preview');

        imgPreview.style.display = 'block';

        const oFReader = new FileReader();
        oFReader.readAsDataURL(image.files[0]);

        oFReader.onload = function(oFREvent) {
        imgPreview.src = oFREvent.target.result;
        }
    }
  </script>
@endpush