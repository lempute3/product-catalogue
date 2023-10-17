<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductType;

class ProductController extends Controller
{
    public function index()
    {
        return Product::with('type', 'images')->get();
    }

    public function getProductTypes() {
        return ProductType::all();
    }

    public function getProductsByType($typeId) {
        return Product::whereHas('type', function ($query) use ($typeId) {
            $query->where('id', $typeId);
        })->with('type', 'images')->get();
    }
}
