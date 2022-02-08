@extends('layouts.app')

@section('content')
  <div class="bg-white pt-4">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8">

          {{-- Title --}}
          <div class="mb-4">
            <h1 class="h3">Profil</h1>
            <p class="text-muted">Dinas Pemberdayaan Masyarakat dan Gampong Kota Langsa</p>
          </div>

          {{-- Gambaran Umum --}}
          <div class="mb-4">
            <h1 class="h5">Gambaran Umum</h1>
            <article class="mb-4">
              {!! $profiles[0]->general  !!}
            </article>
          </div>

          {{-- Visi & Misi --}}
          <div class="mb-4">
            <h1 class="h5">Visi & Misi</h1>
            <article class="mb-4">
              {!! $profiles[0]->visi_misi  !!}
            </article>
          </div>

          {{-- Struktur Organisasi --}}
          <div class="mb-4">
            <h1 class="h5">Struktur Organisasi</h1>
            <article class="mb-4">
              {!! $profiles[0]->org_struct  !!}
            </article>
          </div>

        </div>
      </div>
    </div>
  </div>
@endsection