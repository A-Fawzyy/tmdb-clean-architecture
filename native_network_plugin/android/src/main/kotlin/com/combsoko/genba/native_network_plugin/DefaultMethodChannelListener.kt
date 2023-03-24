package com.combsoko.genba.tmdb_clean_architecture

import android.util.Log
import com.combsoko.genba.native_network_plugin.ApiInterface
import com.combsoko.genba.native_network_plugin.RetrofitClient

class DefaultMethodChannelListener : MethodChannelListener {

	override suspend fun getRequest(url: String, queryParameters: Map<String, Any>): String {
		Log.i("DefaultMethodChannel", "getRequest: $url, $queryParameters")
		val retrofit = RetrofitClient.getInstance()
		val api = retrofit.create(ApiInterface::class.java)
		val fullUrlWithQueryParameters = appendQueryParameters(url, queryParameters)
		return try {
			val response = api.getRequest(fullUrlWithQueryParameters)
			response
		} catch (e: Exception) {
			e.toString()
		}
	}

	/**
	 * append query parameters to url
	 */
	private fun appendQueryParameters(url: String, queryParameters: Map<String, Any>): String {
		var urlWithQueryParameters = url
		queryParameters.onEachIndexed { index, (key, value) ->
			if (index == 0) {
				urlWithQueryParameters += "?$key=$value"
			}
			urlWithQueryParameters += "&$key=$value"
		}
		return urlWithQueryParameters
	}
}
