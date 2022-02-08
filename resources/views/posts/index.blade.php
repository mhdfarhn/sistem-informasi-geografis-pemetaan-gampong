@extends('layouts.app')

@section('content')
  <div class="bg-white pt-4">
    <div class="container">

      {{-- Title --}}
      <div class="mb-4 text-center">
        <h1 class="h3">Semua Berita</h1>
      </div>
    
      {{-- Search Section --}}
      {{-- <div class="mb-4">
        <div class="row justify-content-center">
          <div class="col-md-6 justify-content-center">
            <form action="">
              <div class="input-group">
                <input type="text" name="search" placeholder="Cari di sini" value="" class="form-control">
                <div class="input-group-append">
                  <button type="submit" class="btn btn-primary">Cari</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div> --}}

      {{-- News Section --}}
      <div class="mb-4">
          
        {{-- News Card Big --}}
        @if ($posts->count())
          <div class="card rounded-0 mb-4 text-center">
            <div style="max-height: 400px; overflow: hidden;">
              <img src="{{ asset('storage/' . $posts[0]->image) }}" class="card-img-top rounded-0" alt="{{ $posts[0]->slug . '-img'  }}">
            </div>
            <div class="card-body">
              <h1 class="card-title h5"><a href="/posts/{{ $posts[0]->slug }}">{{ $posts[0]->title }}</a></h1>
              <p class="text-muted">{{ $posts[0]->created_at->diffForHumans() }}</p>
              <p class="card-text">{{ $posts[0]->excerpt  }}</p>
              <a href="/posts/{{ $posts[0]->slug }}" class="btn btn-primary">Selengkapnya</a>
            </div>
          </div>

          <div class="row">

            {{-- News Card Small --}}
            @foreach ($posts->skip(1) as $post)
              <div class="col-md-4 mb-4">
                <div class="card rounded-0">
                  <div style="max-height: 400; overflow: hidden;">
                    <img src="{{ asset('storage/' . $post->image) }}" alt="{{ $post->slug . '-img'  }}" class="card-img-top rounded-0">
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

        @else
          <h1 class="text-center h5">Berita tidak ditemukan.</h1>
        @endif

      </div>

      <div class="pb-4 d-flex justify-content-end">
        {{ $posts->links()  }}
      </div>

    </div>

  </div>
@endsection