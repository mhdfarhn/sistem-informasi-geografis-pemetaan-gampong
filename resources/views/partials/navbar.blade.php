<nav class="navbar navbar-expand-md navbar-light navbar-laravel ">
  <div class="container">
    <a class="navbar-brand" href="{{ url('/') }}">
    <img src="{{ asset('img/favicon.png')  }}" alt="logo-img">
      {{ config('app.name', 'Laravel') }}
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!-- Left Side Of Navbar -->
      <ul class="navbar-nav ml-auto">
        <li class="nav-item {{ Nav::isRoute('index') }}">
          <a class="nav-link" href="{{ route('index') }}">{{ __('Beranda') }}</a>
        </li>
        <li class="nav-item {{ Nav::isRoute('villages') }}">
          <a class="nav-link" href="{{ route('villages') }}">{{ __('Pemetaan Gampong') }}</a>
        </li>
        <li class="nav-item {{ Nav::isRoute('posts') }}">
          <a class="nav-link" href="{{  route('posts')  }}">{{ __('Berita') }}</a>
        </li>
        <li class="nav-item {{  Nav::isRoute('profile')  }}">
          <a href="{{  route('profile')  }}" class="nav-link">{{  __('Profil')  }}</a>
        </li>
        {{-- <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            {{ __('Profil')}}
          </a>
          <div class="dropdown-menu dropdown-menu-left animated--grow-in" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="{{ route('profile') }}">
              {{ __('Visi & Misi') }}
            </a>
            <a class="dropdown-item" href="#">
              {{ __('Tugas Pokok') }}
            </a>
            <a class="dropdown-item" href="#">
              {{ __('Sejarah') }}
            </a>
          </div>
        </li> --}}
      </ul>

      <!-- Right Side Of Navbar -->
      {{-- <ul class="navbar-nav ml-auto">
        <!-- Authentication Links -->
        {{-- @guest
          <li class="nav-item">
            <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
          </li>
          @if (Route::has('register'))
            <li class="nav-item">
                <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
            </li>
          @endif
        @else
          <li class="nav-item dropdown">
            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
              {{ Auth::user()->name }} <span class="caret"></span>
            </a>

            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="{{ route('admin') }}">
                {{ __('Dashboard') }}
              </a>
              <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                {{ __('Logout') }}
              </a>

              <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
              </form>
            </div>
          </li>
        @endguest 
      </ul> --}}
    </div>
  </div>
</nav>