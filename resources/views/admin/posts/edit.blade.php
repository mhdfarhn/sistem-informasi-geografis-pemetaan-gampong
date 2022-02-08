@extends('layouts.admin')

@section('main-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">{{ $title ?? __('Blank Page') }}</h1>

    <!-- Main Content goes here -->

    <div class="card">
        <div class="card-body">
            <form action="{{ route('posts.update', $post->slug) }}" method="post" enctype="multipart/form-data">
                @csrf
                @method('put')

                <div class="form-group">
                  <label for="title">Judul</label>
                  <input type="text" class="form-control @error('title') is-invalid @enderror" name="title" id="title" autocomplete="off" value="{{ old('title', $post->title) }}" required autofocus>
                  @error('title')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                {{-- <div class="form-group">
                  <label for="slug">Slug</label>
                  <input type="text" class="form-control @error('slug') is-invalid @enderror" placeholder="Slug" name="slug" id="slug" value="{{ old('slug') }}" required disabled readonly>
                  @error('slug')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div> --}}

                <div class="form-group">
                  <label for="image">Gambar Berita</label>
                  <input type="hidden" name="oldImage" value="{{ $post->image }}">
                  <img src="{{ asset('storage/' . $post->image)  }}" class="img-preview img-fluid col-sm-4 mb-2 d-block">
                  <input type="file" class="form-control @error('image') is-invalid @enderror" name="image" id="image" onchange="previewImage()">
                  @error('image')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <div class="form-group">
                  <label for="body">Isi Berita</label>
                  <input type="hidden" name="body" id="body" value="{{  old('body', $post->body)  }}">
                  <trix-editor input="body"></trix-editor>
                  @error('body')
                    <span class="text-danger">{{ $message }}</span>
                  @enderror
                </div>

                <button type="submit" class="btn btn-primary">Sunting</button>
                <a href="{{ route('posts.index') }}" class="btn btn-default">Kembali ke daftar berita</a>

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
      // const title = document.querySelector('#title');
      // const slug = document.querySelector('#slug');

      // title.addEventListener('change', function() {
      //     fetch('/admin/posts/checkSlug?title=' + title.value).then(response => response.json()).then(data => slug.value = data.slug)
      // });

      document.addEventListener('trix-file-accept', function(e) {
          e.preventDefault();
      })

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