
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

public class SubBuffer : Buffer
{
	public static Buffer create(Buffer buf, int offset, int size) {
		if(buf == null) {
			return(null);
		}
		var ptr = buf.get_pointer();
		if(ptr == null) {
			return(null);
		}
		var v = new SubBuffer();
		v.original = buf;
		v.ptr = ptr.move(offset);
		v.size = size;
		return(v);
	}

	Buffer original;
	Pointer ptr;
	int size;

	public ptr get_ptr() {
		if(ptr == null) {
			return(null);
		}
		return(ptr.get_native_pointer());
	}

	public Pointer get_pointer() {
		return(ptr);
	}

	public int get_size() {
		return(size);
	}
}
