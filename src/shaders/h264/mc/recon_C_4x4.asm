/*
 * Copyright © <2010>, Intel Corporation.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sub license, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice (including the
 * next paragraph) shall be included in all copies or substantial portions
 * of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
 * IN NO EVENT SHALL PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR
 * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * This file was originally licensed under the following license
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */
// Kernel name: Recon_C_4x4.asm
//
//  $Revision: 11 $
//  $Date: 10/03/06 5:28p $
//


//#if !defined(__RECON_C_4x4__)		// Make sure this is only included once
//#define __RECON_C_4x4__


	// TODO: Use instruction compression
	add.sat (4) r[pERRORC,0]<2>:ub			r[pERRORC,0]<4;4,1>:w			gubCPRED(0)<16;4,4>
	add.sat (4) r[pERRORC,128]<2>:ub		r[pERRORC,128]<4;4,1>:w			gubCPRED(0,2)<16;4,4>
	add.sat (4) r[pERRORC,32]<2>:ub			r[pERRORC,32]<4;4,1>:w			gubCPRED(1)<16;4,4>
	add.sat (4) r[pERRORC,128+32]<2>:ub		r[pERRORC,128+32]<4;4,1>:w		gubCPRED(1,2)<16;4,4>
	
	add.sat (4) r[pERRORC,16]<2>:ub			r[pERRORC,16]<4;4,1>:w			gubCPRED(0,16)<16;4,4>
	add.sat (4) r[pERRORC,128+16]<2>:ub		r[pERRORC,128+16]<4;4,1>:w		gubCPRED(0,18)<16;4,4>
	add.sat (4) r[pERRORC,48]<2>:ub			r[pERRORC,48]<4;4,1>:w			gubCPRED(1,16)<16;4,4>
	add.sat (4) r[pERRORC,128+48]<2>:ub		r[pERRORC,128+48]<4;4,1>:w		gubCPRED(1,18)<16;4,4>

	// Increase chroma error block offset	
#ifndef MONO
	add (1)		pERRORC:w			pERRORC:w						8:w
#endif

        
//#endif	// !defined(__RECON_C_4x4__)
