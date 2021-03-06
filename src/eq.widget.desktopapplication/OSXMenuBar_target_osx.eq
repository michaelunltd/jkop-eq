
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

class OSXMenuBar : MenuBarControl
{
	public static OSXMenuBar for_frame(Frame frame) {
		var ff = frame as NSWindowFrame;
		if(ff == null) {
			return(null);
		}
		return(new OSXMenuBar().set_frame(ff));
	}

	property NSWindowFrame frame;

	public void initialize_menubar(DesktopWindowMenuBar menu, EventReceiver evr) {
		if(frame != null) {
			if(menu == null) {
				frame.set_menus(null, null);
				return;
			}
			frame.set_menus(menu.as_mac_menus(), evr);
		}
	}

	public void finalize() {
		if(frame != null) {
			frame.set_menus(null, null);
			frame = null;
		}
	}
}
