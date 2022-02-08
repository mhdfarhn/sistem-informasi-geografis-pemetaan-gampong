@extends('layouts.admin')

@section('main-content')
  <div class="row justify-content-start">
    <div class="col-lg-8">

      <!-- Page Heading -->
      <h1 class="h3 mb-4 text-gray-800">{{ $post->title}}</h1>

      <!-- Main Content goes here -->
      {{-- Action Button --}}
      <div class="d-flex mb-4">
          <a href="{{ route('posts.index') }}" class="btn btn-sm btn-info mx-1"><i class="fas fa-arrow-left"></i> Kembali ke semua berita</a>
          <a href="{{ route('posts.edit', $post->slug) }}" class="btn btn-sm btn-primary mx-1"><i class="far fa-edit"></i> Sunting berita</a>
          <form action="{{ route('posts.destroy', $post->slug) }}" method="post">
              @csrf
              @method('delete')
              <button type="submit" class="btn btn-sm btn-danger mx-1" onclick="return confirm('Anda yakin ingin menghapus berita ini?')"><i class="far fa-times-circle"></i> Hapus berita</button>
          </form>
      </div>

      {{-- Post Image --}}
      <div class="mb-4" style="max-height: 400px; overflow:hidden;">
        <img src="{{  asset('storage/' . $post->image)  }}" class="img-fluid" alt="{{  $post->slug . '-img'  }}">
      </div>

      {{-- Post Body --}}
      <article class="mb-4">
        {!! $post->body  !!}
      </article>
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
