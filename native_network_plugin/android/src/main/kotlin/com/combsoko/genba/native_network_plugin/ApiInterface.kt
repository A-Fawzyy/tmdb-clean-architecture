package com.combsoko.genba.native_network_plugin

import retrofit2.http.GET
import retrofit2.http.Url

interface ApiInterface {

	/**
	 * Performs a GET request and returns the response as a string
	 */
	@GET
	suspend fun getRequest(@Url url: String): String
}
