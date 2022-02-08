@extends('layouts.admin')

@section('main-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">{{ $title ?? __('Blank Page') }}</h1>

    <!-- Main Content goes here -->

    <a href="{{ route('villages.create') }}" class="btn btn-primary mb-3">Tambah Gampong</a>

    <table class="table table-bordered table-stripped">
        <thead class="text-center">
            <tr>
                <th>No</th>
                <th>Gampong</th>
                <th>Kecamatan</th>
                <th>Website</th>
                <th>#</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($villages as $village)
                <tr>
                    <td scope="row" class="text-center">{{ $loop->iteration }}</td>
                    <td>{{ $village->name }}</td>
                    <td class="text-center">{{ $village->district }}</td>
                    <td class="text-center"><a href="{{ $village->site }}">{{ $village->site }}</a></td>
                    <td class="text-center">
                        <div class="d-flex">
                            <a href="{{ route('villages.edit', $village->id) }}" class="btn btn-sm btn-primary mx-1"><i class="far fa-edit"></i></a>
                            <form action="{{ route('villages.destroy', $village->id) }}" method="post">
                                @csrf
                                @method('delete')
                                <button type="submit" class="btn btn-sm btn-danger mx-1" onclick="return confirm('Anda yakin ingin menghapus gampong ini?')"><i class="far fa-times-circle"></i></button>
                            </form>
                        </div>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>

    {{ $villages->links() }}

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
