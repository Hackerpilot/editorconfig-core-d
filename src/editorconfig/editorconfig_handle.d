/*
 * Copyright (c) 2011-2012 EditorConfig Team
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
 * Header file of EditorConfig handle.
 *
 * Authors: EditorConfig Team
 */
module editorconfig.editorconfig_handle;

extern (C) nothrow @nogc:

/**
 * The editorconfig handle object type
 */
alias editorconfig_handle = void*;

/**
 * Create and intialize a default editorconfig_handle object.
 *
 * Returns:
 * $(UL
 * $(LI NULL Failed to create the editorconfig_handle object.)
 * $(LI non-NULL The created editorconfig_handle object is returned.)
 * )
 */
editorconfig_handle editorconfig_handle_init();

/**
 * Destroy an editorconfig_handle object
 *
 * Params:
 *     h = The editorconfig_handle object needs to be destroyed.
 *
 * Returns:
 * $(UL
 * $(LI zero The editorconfig_handle object is destroyed successfully.)
 * $(LI non-zero Failed to destroy the editorconfig_handle object.)
 * )
 */
int editorconfig_handle_destroy(editorconfig_handle h);

/**
 * Get the err_file field of an editorconfig_handle object
 *
 * Params:
 *     h = The editorconfig_handle object whose err_file needs to be obtained.
 *
 * Returns:
 * $(UL
 * $(LI NULL No error file exists.)
 * $(LI non-NULL The pointer to the path of the file caused the parsing
 * error is returned.)
 * )
 */
const(char*) editorconfig_handle_get_err_file(editorconfig_handle h);

/**
 * Get the version fields of an editorconfig_handle object.
 *
 * Params:
 *     h = The editorconfig_handle object whose version field need to be
 *         obtained.
 *     major = If not null, the integer pointed by major will be filled with
 *         the major version field of the editorconfig_handle object.
 *     minor = If not null, the integer pointed by minor will be filled with
 *         the minor version field of the editorconfig_handle object.
 *     patch = If not null, the integer pointed by patch will be filled
 *         with the patch version field of the editorconfig_handle object.
 */
void editorconfig_handle_get_version(const editorconfig_handle h, int* major,
        int* minor, int* patch);

/**
 * Set the version fields of an editorconfig_handle object.
 *
 * Params:
 *     h = The editorconfig_handle object whose version fields need to be set.
 *     major = If not less than 0, the major version field will be set to
 *         major. If this parameter is less than 0, the major version field of the
 *         editorconfig_handle object will remain unchanged.
 *     minor = If not less than 0, the minor version field will be set to
 *         minor. If this parameter is less than 0, the minor version field of the
 *         editorconfig_handle object will remain unchanged.
 *     patch = If not less than 0, the patch version field will be set to
 *         patch. If this parameter is less than 0, the patch version field of the
 *         editorconfig_handle object will remain unchanged.
 */
void editorconfig_handle_set_version(const editorconfig_handle h, int major,
        int minor, int patch);

/**
 * Set the conf_file_name field of an editorconfig_handle object.
 *
 * Params:
 *     h = The editorconfig_handle object whose conf_file_name field needs to
 *         be set.
 *     conf_file_name = The new value of the conf_file_name field of the
 *         editorconfig_handle object.
 */
void editorconfig_handle_set_conf_file_name(editorconfig_handle h,
        const char* conf_file_name);

/**
 * Get the conf_file_name field of an editorconfig_handle object.
 *
 * Params:
 *     h = The editorconfig_handle object whose conf_file_name field needs to
 *         be obtained.
 *
 * Returns:
 *     The value of the conf_file_name field of the editorconfig_handle
 *     object.
 */
const(char*) editorconfig_handle_get_conf_file_name(const editorconfig_handle h);

/**
 * Get the nth name and value fields of an editorconfig_handle object.
 *
 * Params:
 *     h = The editorconfig_handle object whose name and value fields need to
 *         be obtained.
 *     n = The zero-based index of the name and value fields to be obtained.
 *     name = If not null, *name will be set to point to the obtained name.
 *     value = If not null, *value will be set to point to the obtained value.
 */
void editorconfig_handle_get_name_value(const editorconfig_handle h, int n,
        const char** name, const char** value);

/**
 * Get the count of name and value fields of an editorconfig_handle
 * object.
 *
 * Params:
 *     h = The editorconfig_handle object whose count of name and value fields
 *         need to be obtained.
 *
 * Returns:
 *     the count of name and value fields of the editorconfig_handle object.
 */
int editorconfig_handle_get_name_value_count(const editorconfig_handle h);
