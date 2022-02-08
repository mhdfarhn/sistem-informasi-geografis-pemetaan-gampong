@extends('layouts.admin')

@section('main-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">{{ $title ?? __('Blank Page') }}</h1>

    <!-- Main Content goes here -->

    <a href="{{ route('posts.create') }}" class="btn btn-primary mb-3">Buat berita</a>

    @if (session('message'))
        <div class="alert alert-success">
            {{ session('message') }}
        </div>
    @endif

    <table class="table table-bordered table-stripped">
        <thead class="text-center">
            <tr>
                <th>No</th>
                <th>Judul</th>
                <th>Kutipan</th>
                <th>#</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($posts as $post)
                <tr>
                    <td scope="row">{{ $loop->iteration }}</td>
                    <td>{{ $post->title }}</td>
                    <td>{{ $post->excerpt }}</td>
                    <td>
                        <div class="d-flex">
                            <a href="{{ route('posts.show', $post->slug) }}" class="btn btn-sm btn-info mx-1"><i class="far fa-eye"></i></a>
                            <a href="{{ route('posts.edit', $post->slug) }}" class="btn btn-sm btn-primary mx-1"><i class="far fa-edit"></i></a>
                            <form action="{{ route('posts.destroy', $post->slug) }}" method="post">
                                @csrf
                                @method('delete')
                                <button type="submit" class="btn btn-sm btn-danger mx-1" onclick="return confirm('Anda yakin ingin menghapus berita ini?')"><i class="far fa-times-circle"></i></button>
                            </form>
                        </div>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>

    {{ $posts->links() }}

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
