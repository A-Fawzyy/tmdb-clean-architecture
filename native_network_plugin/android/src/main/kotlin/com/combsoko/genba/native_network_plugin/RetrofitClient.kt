package com.combsoko.genba.native_network_plugin

import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.converter.scalars.ScalarsConverterFactory

object RetrofitClient {
	fun getInstance(): Retrofit {
		val mHttpLoggingInterceptor = HttpLoggingInterceptor()
			.setLevel(HttpLoggingInterceptor.Level.BODY)

		val mOkHttpClient = OkHttpClient
			.Builder()
			.addInterceptor(mHttpLoggingInterceptor)
			.build()


		return Retrofit.Builder()
			.baseUrl("https://www.google.com/")
			.addConverterFactory(ScalarsConverterFactory.create())
			.addConverterFactory(GsonConverterFactory.create())
			.client(mOkHttpClient)
			.build()
	}
}
