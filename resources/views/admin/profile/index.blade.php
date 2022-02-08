@extends('layouts.admin')

@section('main-content')
  <div class="row justify-content-start">
    <div class="col-lg-8">

      <!-- Page Heading -->
      <h1 class="h3 text-gray-800">Profil</h1>
      <p class="text-muted">{{ $profiles[0]->company_name  }}</p>

      <!-- Main Content goes here -->
      {{-- Action Button --}}
      @if ($profiles->count())
        <a href="{{ route('profile.edit', $profiles[0]->id) }}" class="btn btn-sm btn-primary mb-4"><i class="fas fa-edit"></i> Perbarui Profil</a>
      @else
        <a href="{{ route('profile.create') }}" class="btn btn-sm btn-primary mb-4"><i class="fas fa-edit"></i> Lengkapi Profil</a>
      @endif

      {{-- Visi dan Misi Section --}}
      <div class="mb-4">
        <h1 class="h5 text-gray-800">Gambaran Umum</h1>
        <article class="mb-4">
          {!! $profiles[0]->general  !!}
        </article>
      </div>

      {{-- Visi dan Misi Section --}}
      <div class="mb-4">
        <h1 class="h5 text-gray-800">Visi & Misi</h1>
        <article class="mb-4">
          {!! $profiles[0]->visi_misi  !!}
        </article>
      </div>

      {{-- Visi dan Misi Section --}}
      <div class="mb-4">
        <h1 class="h5 text-gray-800">Struktur Organisasi</h1>
        <article class="mb-4">
          {!! $profiles[0]->org_struct  !!}
        </article>
      </div>

    </div>
  </div>
    <!-- end of main content -->
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
