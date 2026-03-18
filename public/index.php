<?php
if (file_exists(__DIR__ . '/../vendor/autoload.php')) {
    require __DIR__ . '/../vendor/autoload.php';
    // If Laravel is installed, let it handle the request
    $app = require_once __DIR__ . '/../bootstrap/app.php';
    $kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
    $response = $kernel->handle(
        $request = Illuminate\Http\Request::capture()
    );
    $response->send();
    $kernel->terminate($request, $response);
} else {
    echo '<!doctype html><html><head><meta charset="utf-8"><title>Teste EasyPanel</title></head><body><h1>Aplicação de teste - EasyPanel</h1><p>Laravel não está instalado ainda. O build do Docker instalará o projeto.</p></body></html>';
}
