@extends('layouts.app')

@section('content')
  <div class="bg-white pt-4">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <h1 class="h3">{{ $post->title }}</h1>
          <p class="text-muted">{{ $post->created_at->diffForHumans() }}</p>
          <div class="mb-4" style="max-height: 400px; overflow: hidden">
            <img src="{{ asset('storage/' . $post->image)  }}" alt="{{ $post->slug . '-img'  }}" class="img-fluid">
          </div>
          <article class="mb-4">
            {!! $post->body  !!}
          </article>
          <a href="/posts" class="text-decoration-none d-block mb-4">Kembali ke Semua Berita</a>
        </div>
      </div>
    </div>
  </div>
@endsection