
/*
 * This file is part of Jkop
 * Copyright (c) 2016 Job and Esther Technologies, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

class HMACSHA1Impl : HMACSHA1
{
	public static HMACSHA1 create() {
		return(new HMACSHA1Impl());
	}

	public Buffer encrypt(String base_string, String signing_key) {
		if(signing_key == null || base_string == null) {
				return(null);
		}
		var signkey = signing_key.to_strptr();
		var basestring = base_string.to_strptr();
		ptr digest;
		embed "java" {{{
			try {
				javax.crypto.Mac lMac = javax.crypto.Mac.getInstance("HmacSHA1");
				javax.crypto.spec.SecretKeySpec lSecret = new javax.crypto.spec.SecretKeySpec(signkey.getBytes(), "HmacSHA1");
				lMac.init(lSecret);
				digest = lMac.doFinal(basestring.getBytes());
			}
			catch(java.security.NoSuchAlgorithmException lEx) {
				throw new RuntimeException("Problems calculating HMAC", lEx);
			}
			catch(java.security.InvalidKeyException lEx) {
				throw new RuntimeException("Problems calculating HMAC", lEx);
			}
		}}}
		return(Buffer.dup(Buffer.for_pointer(Pointer.create(digest), 20)));
	}
}

