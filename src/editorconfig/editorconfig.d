/*
 * Copyright (c) 2011-2013 EditorConfig Team
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * Header file of EditorConfig.
 *
 * Authors: EditorConfig Team
 */
module editorconfig.editorconfig;

public import editorconfig.editorconfig_handle;

extern (C) nothrow @nogc:

/**
 * Parse editorconfig files corresponding to the file path given by
 * full_filename, and related information is input and output in h.
 *
 * An example is available at
 * <a href=https://github.com/editorconfig/editorconfig-core/blob/master/src/bin/main.c>src/bin/main.c</a>
 * in EditorConfig C Core source code.
 *
 * Params:
 *     full_filename = The full path of a file that is edited by the editor
 *         for which the parsing result is.
 *     h = The @ref editorconfig_handle to be used and returned from this
 *         function (including the parsing result). The @ref editorconfig_handle should
 *         be created by editorconfig_handle_init().
 *
 * Returns:
 * $(UL
 * $(LI 0 Everything is OK.)
 *
 * $(LI "Positive Integer" A parsing error occurs. The return value would be
 * the line number of parsing error. err_file obtained from h by calling
 * editorconfig_handle_get_err_file() will also be filled with the file path
 * that caused the parsing error.)
 *
 * $(LI "Negative Integer" Some error occured. See below for the reason of
 * the error for each return value.)
 *
 * $(LI @retval EDITORCONFIG_PARSE_NOT_FULL_PATH The full_filename is not a full
 * path name.)
 *
 * $(LI EDITORCONFIG_PARSE_MEMORY_ERROR A memory error occurs.)
 *
 * $(LI @retval EDITORCONFIG_PARSE_VERSION_TOO_NEW The required version specified in
 * $(D editorconfig_handle) is greater than the current version.)
 * )
 */
int editorconfig_parse(const char* full_filename, editorconfig_handle h);

/**
 * Get the error message from the error number returned by
 * editorconfig_parse().
 *
 * An example is available at
 * <a href=https://github.com/editorconfig/editorconfig-core/blob/master/src/bin/main.c>src/bin/main.c</a>
 * in EditorConfig C Core source code.
 *
 * @param err_num The error number that is used to obtain the error message.
 *
 * Returns: The error message corresponding to err_num.
 */
const(char*) editorconfig_get_error_msg(int err_num);

/**
 * `editorconfig_parse()` return value: the full_filename parameter of
 * `editorconfig_parse()` is not a full path name
 */
enum EDITORCONFIG_PARSE_NOT_FULL_PATH = -2;

/**
 * `editorconfig_parse()` return value: a memory error occurs.
 */
enum EDITORCONFIG_PARSE_MEMORY_ERROR = -3;

/**
 * `editorconfig_parse()` return value: the required version specified in
 * `editorconfig_handle` is greater than the current version.
 */
enum EDITORCONFIG_PARSE_VERSION_TOO_NEW = -4;

/**
 * Get the version number of EditorConfig.
 *
 * An example is available at
 * <a href=https://github.com/editorconfig/editorconfig-core/blob/master/src/bin/main.c>src/bin/main.c</a>
 * in EditorConfig C Core source code.
 *
 * Params:
 *     major = If not null, the integer pointed by major will be filled with
 *         the major version of EditorConfig.
 *     minor = If not null, the integer pointed by minor will be filled with
 *         the minor version of EditorConfig.
 *     patch = If not null, the integer pointed by patch will be filled
 *         with the patch version of EditorConfig.
 */
void editorconfig_get_version(int* major, int* minor, int* patch);

/**
 * Get the version suffix.
 *
 * Returns:
 *     The version suffix, such as "-development" for a development
 *     version, empty string for a stable version.
 */
const(char*) editorconfig_get_version_suffix();
