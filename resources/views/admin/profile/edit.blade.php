@extends('layouts.admin')

@section('main-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">{{ $title ?? __('Blank Page') }}</h1>

    <!-- Main Content goes here -->

    <div class="card">
        <div class="card-body">
            <form action="{{ route('profile.update', $profile->id) }}" method="post">
                @csrf
                @method('put')

                <div class="form-group">
                  <label for="company_name">Nama Instansi</label>
                  <input type="text" class="form-control @error('company_name') is-invalid @enderror" name="company_name" id="company_name" autocomplete="off" value="{{ old('company_name', $profile->company_name ) }}" required autofocus>
                  @error('company_name')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <div class="form-group">
                  <label for="general">Gambaran Umum</label>
                  <input type="hidden" name="general" id="general" value="{{ old('general', $profile->general ) }}">
                  <trix-editor input="general"></trix-editor>
                  @error('general')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <div class="form-group">
                  <label for="visi_misi">Visi & Misi</label>
                  <input type="hidden" name="visi_misi" id="visi_misi" value="{{ old('visi_misi', $profile->visi_misi) }}">
                  <trix-editor input="visi_misi"></trix-editor>
                  @error('visi_misi')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <div class="form-group">
                  <label for="org_struct">Struktur Organisasi</label>
                  <input type="hidden" name="org_struct" id="org_struct" value="{{ old('org_struct', $profile->org_struct ) }}">
                  <trix-editor input="org_struct"></trix-editor>
                  @error('org_struct')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>
                <button type="submit" class="btn btn-primary">Perbarui</button>
                <a href="{{ route('profile.index') }}" class="btn btn-default">Kembali ke Profil</a>

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
      document.addEventListener('trix-file-accept', function(e) {
          e.preventDefault();
      })
  </script>
@endpush