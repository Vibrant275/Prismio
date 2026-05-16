; ModuleID = 'main_module'
source_filename = "main_module"

%Lexer = type { ptr, i32, i32, i32 }
%Token = type { i32, ptr, i32, ptr }
%ASTNode = type { i32, ptr, ptr, i32, i32, ptr, ptr, ptr, ptr }
%Parser = type { ptr }

@.str = private unnamed_addr constant [7 x i8] c"STRING\00"
@.str.1 = private unnamed_addr constant [5 x i8] c"CHAR\00"
@.str.2 = private unnamed_addr constant [7 x i8] c"NUMBER\00"
@.str.3 = private unnamed_addr constant [5 x i8] c"BOOL\00"
@.str.4 = private unnamed_addr constant [11 x i8] c"IDENTIFIER\00"
@.str.5 = private unnamed_addr constant [8 x i8] c"KEYWORD\00"
@.str.6 = private unnamed_addr constant [10 x i8] c"SEPARATOR\00"
@.str.7 = private unnamed_addr constant [9 x i8] c"OPERATOR\00"
@.str.8 = private unnamed_addr constant [7 x i8] c"REL_OP\00"
@.str.9 = private unnamed_addr constant [10 x i8] c"ASSIGN_OP\00"
@.str.10 = private unnamed_addr constant [6 x i8] c"ARROW\00"
@.str.11 = private unnamed_addr constant [4 x i8] c"EOF\00"
@.str.12 = private unnamed_addr constant [6 x i8] c"TOKEN\00"
@.str.13 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.14 = private unnamed_addr constant [6 x i8] c"match\00"
@.str.15 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.16 = private unnamed_addr constant [5 x i8] c"else\00"
@.str.17 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.18 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.19 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.20 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.21 = private unnamed_addr constant [6 x i8] c"break\00"
@.str.22 = private unnamed_addr constant [9 x i8] c"continue\00"
@.str.23 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.24 = private unnamed_addr constant [6 x i8] c"throw\00"
@.str.25 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.26 = private unnamed_addr constant [5 x i8] c"loop\00"
@.str.27 = private unnamed_addr constant [4 x i8] c"for\00"
@.str.28 = private unnamed_addr constant [3 x i8] c"in\00"
@.str.29 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.30 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.31 = private unnamed_addr constant [5 x i8] c"impl\00"
@.str.32 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.33 = private unnamed_addr constant [6 x i8] c"trait\00"
@.str.34 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.35 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.36 = private unnamed_addr constant [4 x i8] c"mut\00"
@.str.37 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.38 = private unnamed_addr constant [6 x i8] c"false\00"
@.str.39 = private unnamed_addr constant [4 x i8] c"EOF\00"
@.str.40 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.41 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.42 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.43 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.44 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.45 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.46 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.47 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.48 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.49 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.50 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.51 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.52 = private unnamed_addr constant [3 x i8] c"=>\00"
@.str.53 = private unnamed_addr constant [3 x i8] c"=>\00"
@.str.54 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.55 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.56 = private unnamed_addr constant [2 x i8] c"?\00"
@.str.57 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.58 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.59 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.60 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.61 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.62 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.63 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.64 = private unnamed_addr constant [10 x i8] c"Error in \00"
@.str.65 = private unnamed_addr constant [23 x i8] c": Expected token type \00"
@.str.66 = private unnamed_addr constant [10 x i8] c"Error in \00"
@.str.67 = private unnamed_addr constant [19 x i8] c": Expected token '\00"
@.str.68 = private unnamed_addr constant [2 x i8] c"'\00"
@.str.69 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.70 = private unnamed_addr constant [17 x i8] c"import statement\00"
@.str.71 = private unnamed_addr constant [21 x i8] c"Expected module name\00"
@.str.72 = private unnamed_addr constant [7 x i8] c"import\00"
@.str.73 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.74 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.75 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.76 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.77 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.78 = private unnamed_addr constant [20 x i8] c"Unknown declaration\00"
@.str.79 = private unnamed_addr constant [2 x i8] c"[\00"
@.str.80 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.81 = private unnamed_addr constant [11 x i8] c"array type\00"
@.str.82 = private unnamed_addr constant [19 x i8] c"Expected type name\00"
@.str.83 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.84 = private unnamed_addr constant [21 x i8] c"variable declaration\00"
@.str.85 = private unnamed_addr constant [4 x i8] c"mut\00"
@.str.86 = private unnamed_addr constant [14 x i8] c"variable name\00"
@.str.87 = private unnamed_addr constant [2 x i8] c":\00"
@.str.88 = private unnamed_addr constant [2 x i8] c"=\00"
@.str.89 = private unnamed_addr constant [7 x i8] c"extern\00"
@.str.90 = private unnamed_addr constant [10 x i8] c"extern fn\00"
@.str.91 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.92 = private unnamed_addr constant [10 x i8] c"extern fn\00"
@.str.93 = private unnamed_addr constant [14 x i8] c"function name\00"
@.str.94 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.95 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.96 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.97 = private unnamed_addr constant [2 x i8] c")\00"
@.str.98 = private unnamed_addr constant [15 x i8] c"parameter name\00"
@.str.99 = private unnamed_addr constant [2 x i8] c":\00"
@.str.100 = private unnamed_addr constant [15 x i8] c"parameter type\00"
@.str.101 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.102 = private unnamed_addr constant [2 x i8] c",\00"
@.str.103 = private unnamed_addr constant [2 x i8] c")\00"
@.str.104 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.105 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.106 = private unnamed_addr constant [3 x i8] c"fn\00"
@.str.107 = private unnamed_addr constant [9 x i8] c"function\00"
@.str.108 = private unnamed_addr constant [14 x i8] c"function name\00"
@.str.109 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.110 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.111 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.112 = private unnamed_addr constant [2 x i8] c")\00"
@.str.113 = private unnamed_addr constant [15 x i8] c"parameter name\00"
@.str.114 = private unnamed_addr constant [2 x i8] c":\00"
@.str.115 = private unnamed_addr constant [15 x i8] c"parameter type\00"
@.str.116 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.117 = private unnamed_addr constant [2 x i8] c",\00"
@.str.118 = private unnamed_addr constant [2 x i8] c")\00"
@.str.119 = private unnamed_addr constant [7 x i8] c"params\00"
@.str.120 = private unnamed_addr constant [3 x i8] c"->\00"
@.str.121 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.122 = private unnamed_addr constant [7 x i8] c"struct\00"
@.str.123 = private unnamed_addr constant [12 x i8] c"struct name\00"
@.str.124 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.125 = private unnamed_addr constant [12 x i8] c"struct body\00"
@.str.126 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.127 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.128 = private unnamed_addr constant [11 x i8] c"field name\00"
@.str.129 = private unnamed_addr constant [2 x i8] c":\00"
@.str.130 = private unnamed_addr constant [11 x i8] c"field type\00"
@.str.131 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.132 = private unnamed_addr constant [2 x i8] c",\00"
@.str.133 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.134 = private unnamed_addr constant [12 x i8] c"struct body\00"
@.str.135 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.136 = private unnamed_addr constant [5 x i8] c"enum\00"
@.str.137 = private unnamed_addr constant [10 x i8] c"enum name\00"
@.str.138 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.139 = private unnamed_addr constant [10 x i8] c"enum body\00"
@.str.140 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.141 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.142 = private unnamed_addr constant [13 x i8] c"variant name\00"
@.str.143 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.144 = private unnamed_addr constant [2 x i8] c",\00"
@.str.145 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.146 = private unnamed_addr constant [10 x i8] c"enum body\00"
@.str.147 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.148 = private unnamed_addr constant [6 x i8] c"block\00"
@.str.149 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.150 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.151 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.152 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.153 = private unnamed_addr constant [6 x i8] c"block\00"
@.str.154 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.155 = private unnamed_addr constant [13 x i8] c"if statement\00"
@.str.156 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.157 = private unnamed_addr constant [13 x i8] c"if condition\00"
@.str.158 = private unnamed_addr constant [2 x i8] c")\00"
@.str.159 = private unnamed_addr constant [13 x i8] c"if condition\00"
@.str.160 = private unnamed_addr constant [5 x i8] c"else\00"
@.str.161 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.162 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.163 = private unnamed_addr constant [16 x i8] c"while statement\00"
@.str.164 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.165 = private unnamed_addr constant [16 x i8] c"while condition\00"
@.str.166 = private unnamed_addr constant [2 x i8] c")\00"
@.str.167 = private unnamed_addr constant [16 x i8] c"while condition\00"
@.str.168 = private unnamed_addr constant [3 x i8] c"if\00"
@.str.169 = private unnamed_addr constant [6 x i8] c"while\00"
@.str.170 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.171 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.172 = private unnamed_addr constant [4 x i8] c"let\00"
@.str.173 = private unnamed_addr constant [2 x i8] c"=\00"
@.str.174 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.175 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.176 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.177 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.178 = private unnamed_addr constant [2 x i8] c"<\00"
@.str.179 = private unnamed_addr constant [2 x i8] c">\00"
@.str.180 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.181 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.182 = private unnamed_addr constant [2 x i8] c"+\00"
@.str.183 = private unnamed_addr constant [2 x i8] c"-\00"
@.str.184 = private unnamed_addr constant [2 x i8] c"*\00"
@.str.185 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.186 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.187 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.188 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.189 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.190 = private unnamed_addr constant [2 x i8] c"{\00"
@.str.191 = private unnamed_addr constant [15 x i8] c"struct literal\00"
@.str.192 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.193 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.194 = private unnamed_addr constant [21 x i8] c"struct literal field\00"
@.str.195 = private unnamed_addr constant [2 x i8] c":\00"
@.str.196 = private unnamed_addr constant [15 x i8] c"struct literal\00"
@.str.197 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.198 = private unnamed_addr constant [2 x i8] c",\00"
@.str.199 = private unnamed_addr constant [2 x i8] c"}\00"
@.str.200 = private unnamed_addr constant [15 x i8] c"struct literal\00"
@.str.201 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.202 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.203 = private unnamed_addr constant [2 x i8] c")\00"
@.str.204 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.205 = private unnamed_addr constant [2 x i8] c",\00"
@.str.206 = private unnamed_addr constant [2 x i8] c")\00"
@.str.207 = private unnamed_addr constant [14 x i8] c"function call\00"
@.str.208 = private unnamed_addr constant [2 x i8] c"[\00"
@.str.209 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.210 = private unnamed_addr constant [12 x i8] c"array index\00"
@.str.211 = private unnamed_addr constant [2 x i8] c".\00"
@.str.212 = private unnamed_addr constant [12 x i8] c"member name\00"
@.str.213 = private unnamed_addr constant [2 x i8] c"(\00"
@.str.214 = private unnamed_addr constant [2 x i8] c")\00"
@.str.215 = private unnamed_addr constant [25 x i8] c"parenthesized expression\00"
@.str.216 = private unnamed_addr constant [2 x i8] c"[\00"
@.str.217 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.218 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.219 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.220 = private unnamed_addr constant [2 x i8] c",\00"
@.str.221 = private unnamed_addr constant [2 x i8] c"]\00"
@.str.222 = private unnamed_addr constant [14 x i8] c"array literal\00"
@.str.223 = private unnamed_addr constant [33 x i8] c"Unexpected token in expression: \00"
@.str.224 = private unnamed_addr constant [3 x i8] c" '\00"
@.str.225 = private unnamed_addr constant [2 x i8] c"'\00"
@.str.226 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.227 = private unnamed_addr constant [1 x i8] zeroinitializer
@ir_string_counter = global i32 0
@.str.228 = private unnamed_addr constant [4 x i8] c"Int\00"
@.str.229 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.230 = private unnamed_addr constant [5 x i8] c"Bool\00"
@.str.231 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.232 = private unnamed_addr constant [7 x i8] c"String\00"
@.str.233 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.234 = private unnamed_addr constant [5 x i8] c"Char\00"
@.str.235 = private unnamed_addr constant [3 x i8] c"i8\00"
@.str.236 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.237 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.238 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.239 = private unnamed_addr constant [8 x i8] c"struct:\00"
@.str.240 = private unnamed_addr constant [8 x i8] c"struct:\00"
@.str.241 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.242 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.243 = private unnamed_addr constant [7 x i8] c"ptrptr\00"
@.str.244 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.245 = private unnamed_addr constant [7 x i8] c"ptrptr\00"
@.str.246 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.247 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.248 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.249 = private unnamed_addr constant [5 x i8] c"$fn$\00"
@.str.250 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.251 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.252 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.253 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.254 = private unnamed_addr constant [3 x i8] c"i8\00"
@.str.255 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.256 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.257 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.258 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.259 = private unnamed_addr constant [2 x i8] c"<\00"
@.str.260 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.261 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.262 = private unnamed_addr constant [2 x i8] c">\00"
@.str.263 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.264 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.265 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.266 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.267 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.268 = private unnamed_addr constant [6 x i8] c"print\00"
@.str.269 = private unnamed_addr constant [8 x i8] c"println\00"
@.str.270 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.271 = private unnamed_addr constant [10 x i8] c"print_int\00"
@.str.272 = private unnamed_addr constant [12 x i8] c"println_int\00"
@.str.273 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.274 = private unnamed_addr constant [13 x i8] c"println_char\00"
@.str.275 = private unnamed_addr constant [11 x i8] c"print_char\00"
@.str.276 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.277 = private unnamed_addr constant [13 x i8] c"println_bool\00"
@.str.278 = private unnamed_addr constant [11 x i8] c"print_bool\00"
@.str.279 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.280 = private unnamed_addr constant [7 x i8] c"ptrptr\00"
@.str.281 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.282 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.283 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.284 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.285 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.286 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.287 = private unnamed_addr constant [5 x i8] c"true\00"
@.str.288 = private unnamed_addr constant [2 x i8] c"1\00"
@.str.289 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.290 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.291 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.292 = private unnamed_addr constant [14 x i8] c" x i8], ptr @\00"
@.str.293 = private unnamed_addr constant [15 x i8] c", i64 0, i64 0\00"
@.str.294 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.295 = private unnamed_addr constant [18 x i8] c" = getelementptr \00"
@.str.296 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.297 = private unnamed_addr constant [18 x i8] c", ptr null, i32 1\00"
@.str.298 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.299 = private unnamed_addr constant [17 x i8] c" = ptrtoint ptr \00"
@.str.300 = private unnamed_addr constant [8 x i8] c" to i64\00"
@.str.301 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.302 = private unnamed_addr constant [25 x i8] c" = call ptr @malloc(i64 \00"
@.str.303 = private unnamed_addr constant [2 x i8] c")\00"
@.str.304 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.305 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.306 = private unnamed_addr constant [27 x i8] c" = getelementptr inbounds \00"
@.str.307 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.308 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.309 = private unnamed_addr constant [14 x i8] c", i32 0, i32 \00"
@.str.310 = private unnamed_addr constant [9 x i8] c"  store \00"
@.str.311 = private unnamed_addr constant [2 x i8] c" \00"
@.str.312 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.313 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.314 = private unnamed_addr constant [27 x i8] c" = getelementptr inbounds \00"
@.str.315 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.316 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.317 = private unnamed_addr constant [14 x i8] c", i32 0, i32 \00"
@.str.318 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.319 = private unnamed_addr constant [9 x i8] c" = load \00"
@.str.320 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.321 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.322 = private unnamed_addr constant [12 x i8] c" = alloca [\00"
@.str.323 = private unnamed_addr constant [8 x i8] c" x ptr]\00"
@.str.324 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.325 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.326 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.327 = private unnamed_addr constant [14 x i8] c" x ptr], ptr \00"
@.str.328 = private unnamed_addr constant [14 x i8] c", i64 0, i64 \00"
@.str.329 = private unnamed_addr constant [13 x i8] c"  store ptr \00"
@.str.330 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.331 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.332 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.333 = private unnamed_addr constant [14 x i8] c" x ptr], ptr \00"
@.str.334 = private unnamed_addr constant [15 x i8] c", i64 0, i64 0\00"
@.str.335 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.336 = private unnamed_addr constant [12 x i8] c" = alloca [\00"
@.str.337 = private unnamed_addr constant [8 x i8] c" x i32]\00"
@.str.338 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.339 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.340 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.341 = private unnamed_addr constant [14 x i8] c" x i32], ptr \00"
@.str.342 = private unnamed_addr constant [14 x i8] c", i64 0, i64 \00"
@.str.343 = private unnamed_addr constant [13 x i8] c"  store i32 \00"
@.str.344 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.345 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.346 = private unnamed_addr constant [28 x i8] c" = getelementptr inbounds [\00"
@.str.347 = private unnamed_addr constant [14 x i8] c" x i32], ptr \00"
@.str.348 = private unnamed_addr constant [15 x i8] c", i64 0, i64 0\00"
@.str.349 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.350 = private unnamed_addr constant [7 x i8] c"ptrptr\00"
@.str.351 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.352 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.353 = private unnamed_addr constant [27 x i8] c" = getelementptr inbounds \00"
@.str.354 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.355 = private unnamed_addr constant [7 x i8] c", i32 \00"
@.str.356 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.357 = private unnamed_addr constant [9 x i8] c" = load \00"
@.str.358 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.359 = private unnamed_addr constant [2 x i8] c"+\00"
@.str.360 = private unnamed_addr constant [2 x i8] c"-\00"
@.str.361 = private unnamed_addr constant [2 x i8] c"*\00"
@.str.362 = private unnamed_addr constant [2 x i8] c"/\00"
@.str.363 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.364 = private unnamed_addr constant [3 x i8] c"==\00"
@.str.365 = private unnamed_addr constant [3 x i8] c"!=\00"
@.str.366 = private unnamed_addr constant [2 x i8] c"<\00"
@.str.367 = private unnamed_addr constant [3 x i8] c"<=\00"
@.str.368 = private unnamed_addr constant [2 x i8] c">\00"
@.str.369 = private unnamed_addr constant [3 x i8] c">=\00"
@.str.370 = private unnamed_addr constant [4 x i8] c"and\00"
@.str.371 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.372 = private unnamed_addr constant [3 x i8] c"or\00"
@.str.373 = private unnamed_addr constant [3 x i8] c"i1\00"
@.str.374 = private unnamed_addr constant [6 x i8] c"print\00"
@.str.375 = private unnamed_addr constant [8 x i8] c"println\00"
@.str.376 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.377 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.378 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.379 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.380 = private unnamed_addr constant [6 x i8] c"print\00"
@.str.381 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.382 = private unnamed_addr constant [8 x i8] c"println\00"
@.str.383 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.384 = private unnamed_addr constant [10 x i8] c"print_int\00"
@.str.385 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.386 = private unnamed_addr constant [12 x i8] c"println_int\00"
@.str.387 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.388 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.389 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.390 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.391 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.392 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.393 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.394 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.395 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.396 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.397 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.398 = private unnamed_addr constant [27 x i8] c" = getelementptr inbounds \00"
@.str.399 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.400 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.401 = private unnamed_addr constant [14 x i8] c", i32 0, i32 \00"
@.str.402 = private unnamed_addr constant [9 x i8] c"  store \00"
@.str.403 = private unnamed_addr constant [2 x i8] c" \00"
@.str.404 = private unnamed_addr constant [7 x i8] c", ptr \00"
@.str.405 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.406 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.407 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.408 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.409 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.410 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.411 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.412 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.413 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.414 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.415 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.416 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.417 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.418 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.419 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.420 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.421 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.422 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.423 = private unnamed_addr constant [3 x i8] c"p_\00"
@.str.424 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.425 = private unnamed_addr constant [4 x i8] c"%p_\00"
@.str.426 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.427 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.428 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.429 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.430 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.431 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.432 = private unnamed_addr constant [7 x i8] c".str.s\00"
@.str.433 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.434 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.435 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.436 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.437 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.438 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.439 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.440 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.441 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.442 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.443 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.444 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.445 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.446 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.447 = private unnamed_addr constant [11 x i8] c" = type { \00"
@.str.448 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.449 = private unnamed_addr constant [3 x i8] c", \00"
@.str.450 = private unnamed_addr constant [3 x i8] c" }\00"
@.str.451 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.452 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.453 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.454 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.455 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.456 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.457 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.458 = private unnamed_addr constant [19 x i8] c"self_hosted_module\00"
@.str.459 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.460 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.461 = private unnamed_addr constant [7 x i8] c"malloc\00"
@.str.462 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.463 = private unnamed_addr constant [4 x i8] c"i64\00"
@.str.464 = private unnamed_addr constant [8 x i8] c"println\00"
@.str.465 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.466 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.467 = private unnamed_addr constant [6 x i8] c"print\00"
@.str.468 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.469 = private unnamed_addr constant [4 x i8] c"ptr\00"
@.str.470 = private unnamed_addr constant [12 x i8] c"println_int\00"
@.str.471 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.472 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.473 = private unnamed_addr constant [10 x i8] c"print_int\00"
@.str.474 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.475 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.476 = private unnamed_addr constant [13 x i8] c"println_bool\00"
@.str.477 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.478 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.479 = private unnamed_addr constant [11 x i8] c"print_bool\00"
@.str.480 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.481 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.482 = private unnamed_addr constant [13 x i8] c"println_char\00"
@.str.483 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.484 = private unnamed_addr constant [3 x i8] c"i8\00"
@.str.485 = private unnamed_addr constant [11 x i8] c"print_char\00"
@.str.486 = private unnamed_addr constant [5 x i8] c"void\00"
@.str.487 = private unnamed_addr constant [3 x i8] c"i8\00"
@.str.488 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.489 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.490 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.491 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.492 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.493 = private unnamed_addr constant [5 x i8] c"main\00"
@.str.494 = private unnamed_addr constant [4 x i8] c"i32\00"
@.str.495 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.496 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.497 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.498 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.499 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.500 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.501 = private unnamed_addr constant [5 x i8] c".psm\00"
@.str.502 = private unnamed_addr constant [2 x i8] c".\00"
@.str.503 = private unnamed_addr constant [3 x i8] c"\\\\\00"
@.str.504 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.505 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.506 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.507 = private unnamed_addr constant [25 x i8] c"ERROR: Could not import \00"
@.str.508 = private unnamed_addr constant [29 x i8] c"=== Self-Hosted Compiler ===\00"
@.str.509 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.510 = private unnamed_addr constant [7 x i8] c"out.ll\00"
@.str.511 = private unnamed_addr constant [1 x i8] zeroinitializer
@.str.512 = private unnamed_addr constant [27 x i8] c"ERROR: Could not read file\00"
@.str.513 = private unnamed_addr constant [14 x i8] c"File content:\00"
@.str.514 = private unnamed_addr constant [20 x i8] c"\E2\9C\93 Lexing complete\00"
@.str.515 = private unnamed_addr constant [21 x i8] c"\E2\9C\93 Parsing complete\00"
@.str.516 = private unnamed_addr constant [17 x i8] c"Generating IR...\00"
@.str.517 = private unnamed_addr constant [19 x i8] c"\E2\9C\93 IR written to \00"
@.str.518 = private unnamed_addr constant [13 x i8] c"=== Done ===\00"

declare ptr @malloc(i64)

declare i32 @printf(ptr, ...)

declare void @println(ptr)

declare void @print(ptr)

declare void @println_int(i32)

declare void @print_int(i32)

declare i32 @str_equals(ptr, ptr)

declare i32 @str_length(ptr)

declare ptr @str_concat(ptr, ptr)

declare ptr @str_substring(ptr, i32, i32)

declare i8 @str_char_at(ptr, i32)

declare i32 @str_contains(ptr, ptr)

declare i32 @str_starts_with(ptr, ptr)

declare i32 @str_index_of(ptr, ptr)

declare ptr @int_to_str(i32)

declare i32 @str_to_int(ptr)

declare void @println_bool(i32)

declare void @print_bool(i32)

declare void @println_char(i8)

declare void @print_char(i8)

define ptr @type_to_string(i32 %t) {
entry:
  %t1 = alloca i32, align 4
  store i32 %t, ptr %t1, align 4
  %t2 = load i32, ptr %t1, align 4
  %eqtmp = icmp eq i32 %t2, 0
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret ptr @.str

ifcont:                                           ; preds = %entry
  %t3 = load i32, ptr %t1, align 4
  %eqtmp4 = icmp eq i32 %t3, 1
  %ifcond5 = icmp ne i1 %eqtmp4, false
  br i1 %ifcond5, label %then6, label %ifcont7

then6:                                            ; preds = %ifcont
  ret ptr @.str.1

ifcont7:                                          ; preds = %ifcont
  %t8 = load i32, ptr %t1, align 4
  %eqtmp9 = icmp eq i32 %t8, 2
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %ifcont12

then11:                                           ; preds = %ifcont7
  ret ptr @.str.2

ifcont12:                                         ; preds = %ifcont7
  %t13 = load i32, ptr %t1, align 4
  %eqtmp14 = icmp eq i32 %t13, 3
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont17

then16:                                           ; preds = %ifcont12
  ret ptr @.str.3

ifcont17:                                         ; preds = %ifcont12
  %t18 = load i32, ptr %t1, align 4
  %eqtmp19 = icmp eq i32 %t18, 4
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %ifcont17
  ret ptr @.str.4

ifcont22:                                         ; preds = %ifcont17
  %t23 = load i32, ptr %t1, align 4
  %eqtmp24 = icmp eq i32 %t23, 16
  %ifcond25 = icmp ne i1 %eqtmp24, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont22
  ret ptr @.str.5

ifcont27:                                         ; preds = %ifcont22
  %t28 = load i32, ptr %t1, align 4
  %eqtmp29 = icmp eq i32 %t28, 5
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont27
  ret ptr @.str.6

ifcont32:                                         ; preds = %ifcont27
  %t33 = load i32, ptr %t1, align 4
  %eqtmp34 = icmp eq i32 %t33, 7
  %ifcond35 = icmp ne i1 %eqtmp34, false
  br i1 %ifcond35, label %then36, label %ifcont37

then36:                                           ; preds = %ifcont32
  ret ptr @.str.7

ifcont37:                                         ; preds = %ifcont32
  %t38 = load i32, ptr %t1, align 4
  %eqtmp39 = icmp eq i32 %t38, 8
  %ifcond40 = icmp ne i1 %eqtmp39, false
  br i1 %ifcond40, label %then41, label %ifcont42

then41:                                           ; preds = %ifcont37
  ret ptr @.str.8

ifcont42:                                         ; preds = %ifcont37
  %t43 = load i32, ptr %t1, align 4
  %eqtmp44 = icmp eq i32 %t43, 11
  %ifcond45 = icmp ne i1 %eqtmp44, false
  br i1 %ifcond45, label %then46, label %ifcont47

then46:                                           ; preds = %ifcont42
  ret ptr @.str.9

ifcont47:                                         ; preds = %ifcont42
  %t48 = load i32, ptr %t1, align 4
  %eqtmp49 = icmp eq i32 %t48, 14
  %ifcond50 = icmp ne i1 %eqtmp49, false
  br i1 %ifcond50, label %then51, label %ifcont52

then51:                                           ; preds = %ifcont47
  ret ptr @.str.10

ifcont52:                                         ; preds = %ifcont47
  %t53 = load i32, ptr %t1, align 4
  %eqtmp54 = icmp eq i32 %t53, 18
  %ifcond55 = icmp ne i1 %eqtmp54, false
  br i1 %ifcond55, label %then56, label %ifcont57

then56:                                           ; preds = %ifcont52
  ret ptr @.str.11

ifcont57:                                         ; preds = %ifcont52
  ret ptr @.str.12
}

define i1 @is_digit(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %getmp = icmp sge i8 %c2, 48
  %c3 = load i8, ptr %c1, align 1
  %letmp = icmp sle i8 %c3, 57
  %andtmp = and i1 %getmp, %letmp
  ret i1 %andtmp
}

define i1 @is_alpha(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %getmp = icmp sge i8 %c2, 97
  %c3 = load i8, ptr %c1, align 1
  %letmp = icmp sle i8 %c3, 122
  %andtmp = and i1 %getmp, %letmp
  %c4 = load i8, ptr %c1, align 1
  %getmp5 = icmp sge i8 %c4, 65
  %c6 = load i8, ptr %c1, align 1
  %letmp7 = icmp sle i8 %c6, 90
  %andtmp8 = and i1 %getmp5, %letmp7
  %c9 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c9, 95
  %ortmp = or i1 %andtmp8, %eqtmp
  %ortmp10 = or i1 %andtmp, %ortmp
  ret i1 %ortmp10
}

define i1 @is_alnum(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %calltmp = call i1 @is_alpha(i8 %c2)
  %c3 = load i8, ptr %c1, align 1
  %calltmp4 = call i1 @is_digit(i8 %c3)
  %ortmp = or i1 %calltmp, %calltmp4
  ret i1 %ortmp
}

define i1 @is_space(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c2, 32
  %c3 = load i8, ptr %c1, align 1
  %eqtmp4 = icmp eq i8 %c3, 9
  %c5 = load i8, ptr %c1, align 1
  %eqtmp6 = icmp eq i8 %c5, 10
  %c7 = load i8, ptr %c1, align 1
  %eqtmp8 = icmp eq i8 %c7, 13
  %ortmp = or i1 %eqtmp6, %eqtmp8
  %ortmp9 = or i1 %eqtmp4, %ortmp
  %ortmp10 = or i1 %eqtmp, %ortmp9
  ret i1 %ortmp10
}

define i1 @is_separator(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c2, 40
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %c3 = load i8, ptr %c1, align 1
  %eqtmp4 = icmp eq i8 %c3, 41
  %ifcond5 = icmp ne i1 %eqtmp4, false
  br i1 %ifcond5, label %then6, label %ifcont7

then6:                                            ; preds = %ifcont
  ret i1 true

ifcont7:                                          ; preds = %ifcont
  %c8 = load i8, ptr %c1, align 1
  %eqtmp9 = icmp eq i8 %c8, 123
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %ifcont12

then11:                                           ; preds = %ifcont7
  ret i1 true

ifcont12:                                         ; preds = %ifcont7
  %c13 = load i8, ptr %c1, align 1
  %eqtmp14 = icmp eq i8 %c13, 125
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont17

then16:                                           ; preds = %ifcont12
  ret i1 true

ifcont17:                                         ; preds = %ifcont12
  %c18 = load i8, ptr %c1, align 1
  %eqtmp19 = icmp eq i8 %c18, 91
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %ifcont17
  ret i1 true

ifcont22:                                         ; preds = %ifcont17
  %c23 = load i8, ptr %c1, align 1
  %eqtmp24 = icmp eq i8 %c23, 93
  %ifcond25 = icmp ne i1 %eqtmp24, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont22
  ret i1 true

ifcont27:                                         ; preds = %ifcont22
  %c28 = load i8, ptr %c1, align 1
  %eqtmp29 = icmp eq i8 %c28, 44
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont27
  ret i1 true

ifcont32:                                         ; preds = %ifcont27
  %c33 = load i8, ptr %c1, align 1
  %eqtmp34 = icmp eq i8 %c33, 46
  %ifcond35 = icmp ne i1 %eqtmp34, false
  br i1 %ifcond35, label %then36, label %ifcont37

then36:                                           ; preds = %ifcont32
  ret i1 true

ifcont37:                                         ; preds = %ifcont32
  %c38 = load i8, ptr %c1, align 1
  %eqtmp39 = icmp eq i8 %c38, 58
  %ifcond40 = icmp ne i1 %eqtmp39, false
  br i1 %ifcond40, label %then41, label %ifcont42

then41:                                           ; preds = %ifcont37
  ret i1 true

ifcont42:                                         ; preds = %ifcont37
  ret i1 false
}

define i1 @is_operator(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c2, 43
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %c3 = load i8, ptr %c1, align 1
  %eqtmp4 = icmp eq i8 %c3, 45
  %ifcond5 = icmp ne i1 %eqtmp4, false
  br i1 %ifcond5, label %then6, label %ifcont7

then6:                                            ; preds = %ifcont
  ret i1 true

ifcont7:                                          ; preds = %ifcont
  %c8 = load i8, ptr %c1, align 1
  %eqtmp9 = icmp eq i8 %c8, 42
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %ifcont12

then11:                                           ; preds = %ifcont7
  ret i1 true

ifcont12:                                         ; preds = %ifcont7
  %c13 = load i8, ptr %c1, align 1
  %eqtmp14 = icmp eq i8 %c13, 47
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont17

then16:                                           ; preds = %ifcont12
  ret i1 true

ifcont17:                                         ; preds = %ifcont12
  %c18 = load i8, ptr %c1, align 1
  %eqtmp19 = icmp eq i8 %c18, 37
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %ifcont17
  ret i1 true

ifcont22:                                         ; preds = %ifcont17
  %c23 = load i8, ptr %c1, align 1
  %eqtmp24 = icmp eq i8 %c23, 60
  %ifcond25 = icmp ne i1 %eqtmp24, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont22
  ret i1 true

ifcont27:                                         ; preds = %ifcont22
  %c28 = load i8, ptr %c1, align 1
  %eqtmp29 = icmp eq i8 %c28, 62
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont27
  ret i1 true

ifcont32:                                         ; preds = %ifcont27
  %c33 = load i8, ptr %c1, align 1
  %eqtmp34 = icmp eq i8 %c33, 33
  %ifcond35 = icmp ne i1 %eqtmp34, false
  br i1 %ifcond35, label %then36, label %ifcont37

then36:                                           ; preds = %ifcont32
  ret i1 true

ifcont37:                                         ; preds = %ifcont32
  %c38 = load i8, ptr %c1, align 1
  %eqtmp39 = icmp eq i8 %c38, 38
  %ifcond40 = icmp ne i1 %eqtmp39, false
  br i1 %ifcond40, label %then41, label %ifcont42

then41:                                           ; preds = %ifcont37
  ret i1 true

ifcont42:                                         ; preds = %ifcont37
  %c43 = load i8, ptr %c1, align 1
  %eqtmp44 = icmp eq i8 %c43, 124
  %ifcond45 = icmp ne i1 %eqtmp44, false
  br i1 %ifcond45, label %then46, label %ifcont47

then46:                                           ; preds = %ifcont42
  ret i1 true

ifcont47:                                         ; preds = %ifcont42
  %c48 = load i8, ptr %c1, align 1
  %eqtmp49 = icmp eq i8 %c48, 61
  %ifcond50 = icmp ne i1 %eqtmp49, false
  br i1 %ifcond50, label %then51, label %ifcont52

then51:                                           ; preds = %ifcont47
  ret i1 true

ifcont52:                                         ; preds = %ifcont47
  %c53 = load i8, ptr %c1, align 1
  %eqtmp54 = icmp eq i8 %c53, 95
  %ifcond55 = icmp ne i1 %eqtmp54, false
  br i1 %ifcond55, label %then56, label %ifcont57

then56:                                           ; preds = %ifcont52
  ret i1 true

ifcont57:                                         ; preds = %ifcont52
  ret i1 false
}

define i32 @char_code(i8 %c) {
entry:
  %c1 = alloca i8, align 1
  store i8 %c, ptr %c1, align 1
  %c2 = load i8, ptr %c1, align 1
  %eqtmp = icmp eq i8 %c2, 0
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i32 0

ifcont:                                           ; preds = %entry
  %c3 = load i8, ptr %c1, align 1
  %eqtmp4 = icmp eq i8 %c3, 9
  %ifcond5 = icmp ne i1 %eqtmp4, false
  br i1 %ifcond5, label %then6, label %ifcont7

then6:                                            ; preds = %ifcont
  ret i32 9

ifcont7:                                          ; preds = %ifcont
  %c8 = load i8, ptr %c1, align 1
  %eqtmp9 = icmp eq i8 %c8, 10
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %ifcont12

then11:                                           ; preds = %ifcont7
  ret i32 10

ifcont12:                                         ; preds = %ifcont7
  %c13 = load i8, ptr %c1, align 1
  %eqtmp14 = icmp eq i8 %c13, 13
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont17

then16:                                           ; preds = %ifcont12
  ret i32 13

ifcont17:                                         ; preds = %ifcont12
  %c18 = load i8, ptr %c1, align 1
  %eqtmp19 = icmp eq i8 %c18, 32
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %ifcont17
  ret i32 32

ifcont22:                                         ; preds = %ifcont17
  %c23 = load i8, ptr %c1, align 1
  %eqtmp24 = icmp eq i8 %c23, 33
  %ifcond25 = icmp ne i1 %eqtmp24, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont22
  ret i32 33

ifcont27:                                         ; preds = %ifcont22
  %c28 = load i8, ptr %c1, align 1
  %eqtmp29 = icmp eq i8 %c28, 34
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont27
  ret i32 34

ifcont32:                                         ; preds = %ifcont27
  %c33 = load i8, ptr %c1, align 1
  %eqtmp34 = icmp eq i8 %c33, 37
  %ifcond35 = icmp ne i1 %eqtmp34, false
  br i1 %ifcond35, label %then36, label %ifcont37

then36:                                           ; preds = %ifcont32
  ret i32 37

ifcont37:                                         ; preds = %ifcont32
  %c38 = load i8, ptr %c1, align 1
  %eqtmp39 = icmp eq i8 %c38, 38
  %ifcond40 = icmp ne i1 %eqtmp39, false
  br i1 %ifcond40, label %then41, label %ifcont42

then41:                                           ; preds = %ifcont37
  ret i32 38

ifcont42:                                         ; preds = %ifcont37
  %c43 = load i8, ptr %c1, align 1
  %eqtmp44 = icmp eq i8 %c43, 39
  %ifcond45 = icmp ne i1 %eqtmp44, false
  br i1 %ifcond45, label %then46, label %ifcont47

then46:                                           ; preds = %ifcont42
  ret i32 39

ifcont47:                                         ; preds = %ifcont42
  %c48 = load i8, ptr %c1, align 1
  %eqtmp49 = icmp eq i8 %c48, 40
  %ifcond50 = icmp ne i1 %eqtmp49, false
  br i1 %ifcond50, label %then51, label %ifcont52

then51:                                           ; preds = %ifcont47
  ret i32 40

ifcont52:                                         ; preds = %ifcont47
  %c53 = load i8, ptr %c1, align 1
  %eqtmp54 = icmp eq i8 %c53, 41
  %ifcond55 = icmp ne i1 %eqtmp54, false
  br i1 %ifcond55, label %then56, label %ifcont57

then56:                                           ; preds = %ifcont52
  ret i32 41

ifcont57:                                         ; preds = %ifcont52
  %c58 = load i8, ptr %c1, align 1
  %eqtmp59 = icmp eq i8 %c58, 42
  %ifcond60 = icmp ne i1 %eqtmp59, false
  br i1 %ifcond60, label %then61, label %ifcont62

then61:                                           ; preds = %ifcont57
  ret i32 42

ifcont62:                                         ; preds = %ifcont57
  %c63 = load i8, ptr %c1, align 1
  %eqtmp64 = icmp eq i8 %c63, 43
  %ifcond65 = icmp ne i1 %eqtmp64, false
  br i1 %ifcond65, label %then66, label %ifcont67

then66:                                           ; preds = %ifcont62
  ret i32 43

ifcont67:                                         ; preds = %ifcont62
  %c68 = load i8, ptr %c1, align 1
  %eqtmp69 = icmp eq i8 %c68, 44
  %ifcond70 = icmp ne i1 %eqtmp69, false
  br i1 %ifcond70, label %then71, label %ifcont72

then71:                                           ; preds = %ifcont67
  ret i32 44

ifcont72:                                         ; preds = %ifcont67
  %c73 = load i8, ptr %c1, align 1
  %eqtmp74 = icmp eq i8 %c73, 45
  %ifcond75 = icmp ne i1 %eqtmp74, false
  br i1 %ifcond75, label %then76, label %ifcont77

then76:                                           ; preds = %ifcont72
  ret i32 45

ifcont77:                                         ; preds = %ifcont72
  %c78 = load i8, ptr %c1, align 1
  %eqtmp79 = icmp eq i8 %c78, 46
  %ifcond80 = icmp ne i1 %eqtmp79, false
  br i1 %ifcond80, label %then81, label %ifcont82

then81:                                           ; preds = %ifcont77
  ret i32 46

ifcont82:                                         ; preds = %ifcont77
  %c83 = load i8, ptr %c1, align 1
  %eqtmp84 = icmp eq i8 %c83, 47
  %ifcond85 = icmp ne i1 %eqtmp84, false
  br i1 %ifcond85, label %then86, label %ifcont87

then86:                                           ; preds = %ifcont82
  ret i32 47

ifcont87:                                         ; preds = %ifcont82
  %c88 = load i8, ptr %c1, align 1
  %eqtmp89 = icmp eq i8 %c88, 48
  %ifcond90 = icmp ne i1 %eqtmp89, false
  br i1 %ifcond90, label %then91, label %ifcont92

then91:                                           ; preds = %ifcont87
  ret i32 48

ifcont92:                                         ; preds = %ifcont87
  %c93 = load i8, ptr %c1, align 1
  %eqtmp94 = icmp eq i8 %c93, 49
  %ifcond95 = icmp ne i1 %eqtmp94, false
  br i1 %ifcond95, label %then96, label %ifcont97

then96:                                           ; preds = %ifcont92
  ret i32 49

ifcont97:                                         ; preds = %ifcont92
  %c98 = load i8, ptr %c1, align 1
  %eqtmp99 = icmp eq i8 %c98, 50
  %ifcond100 = icmp ne i1 %eqtmp99, false
  br i1 %ifcond100, label %then101, label %ifcont102

then101:                                          ; preds = %ifcont97
  ret i32 50

ifcont102:                                        ; preds = %ifcont97
  %c103 = load i8, ptr %c1, align 1
  %eqtmp104 = icmp eq i8 %c103, 51
  %ifcond105 = icmp ne i1 %eqtmp104, false
  br i1 %ifcond105, label %then106, label %ifcont107

then106:                                          ; preds = %ifcont102
  ret i32 51

ifcont107:                                        ; preds = %ifcont102
  %c108 = load i8, ptr %c1, align 1
  %eqtmp109 = icmp eq i8 %c108, 52
  %ifcond110 = icmp ne i1 %eqtmp109, false
  br i1 %ifcond110, label %then111, label %ifcont112

then111:                                          ; preds = %ifcont107
  ret i32 52

ifcont112:                                        ; preds = %ifcont107
  %c113 = load i8, ptr %c1, align 1
  %eqtmp114 = icmp eq i8 %c113, 53
  %ifcond115 = icmp ne i1 %eqtmp114, false
  br i1 %ifcond115, label %then116, label %ifcont117

then116:                                          ; preds = %ifcont112
  ret i32 53

ifcont117:                                        ; preds = %ifcont112
  %c118 = load i8, ptr %c1, align 1
  %eqtmp119 = icmp eq i8 %c118, 54
  %ifcond120 = icmp ne i1 %eqtmp119, false
  br i1 %ifcond120, label %then121, label %ifcont122

then121:                                          ; preds = %ifcont117
  ret i32 54

ifcont122:                                        ; preds = %ifcont117
  %c123 = load i8, ptr %c1, align 1
  %eqtmp124 = icmp eq i8 %c123, 55
  %ifcond125 = icmp ne i1 %eqtmp124, false
  br i1 %ifcond125, label %then126, label %ifcont127

then126:                                          ; preds = %ifcont122
  ret i32 55

ifcont127:                                        ; preds = %ifcont122
  %c128 = load i8, ptr %c1, align 1
  %eqtmp129 = icmp eq i8 %c128, 56
  %ifcond130 = icmp ne i1 %eqtmp129, false
  br i1 %ifcond130, label %then131, label %ifcont132

then131:                                          ; preds = %ifcont127
  ret i32 56

ifcont132:                                        ; preds = %ifcont127
  %c133 = load i8, ptr %c1, align 1
  %eqtmp134 = icmp eq i8 %c133, 57
  %ifcond135 = icmp ne i1 %eqtmp134, false
  br i1 %ifcond135, label %then136, label %ifcont137

then136:                                          ; preds = %ifcont132
  ret i32 57

ifcont137:                                        ; preds = %ifcont132
  %c138 = load i8, ptr %c1, align 1
  %eqtmp139 = icmp eq i8 %c138, 58
  %ifcond140 = icmp ne i1 %eqtmp139, false
  br i1 %ifcond140, label %then141, label %ifcont142

then141:                                          ; preds = %ifcont137
  ret i32 58

ifcont142:                                        ; preds = %ifcont137
  %c143 = load i8, ptr %c1, align 1
  %eqtmp144 = icmp eq i8 %c143, 60
  %ifcond145 = icmp ne i1 %eqtmp144, false
  br i1 %ifcond145, label %then146, label %ifcont147

then146:                                          ; preds = %ifcont142
  ret i32 60

ifcont147:                                        ; preds = %ifcont142
  %c148 = load i8, ptr %c1, align 1
  %eqtmp149 = icmp eq i8 %c148, 61
  %ifcond150 = icmp ne i1 %eqtmp149, false
  br i1 %ifcond150, label %then151, label %ifcont152

then151:                                          ; preds = %ifcont147
  ret i32 61

ifcont152:                                        ; preds = %ifcont147
  %c153 = load i8, ptr %c1, align 1
  %eqtmp154 = icmp eq i8 %c153, 62
  %ifcond155 = icmp ne i1 %eqtmp154, false
  br i1 %ifcond155, label %then156, label %ifcont157

then156:                                          ; preds = %ifcont152
  ret i32 62

ifcont157:                                        ; preds = %ifcont152
  %c158 = load i8, ptr %c1, align 1
  %eqtmp159 = icmp eq i8 %c158, 65
  %ifcond160 = icmp ne i1 %eqtmp159, false
  br i1 %ifcond160, label %then161, label %ifcont162

then161:                                          ; preds = %ifcont157
  ret i32 65

ifcont162:                                        ; preds = %ifcont157
  %c163 = load i8, ptr %c1, align 1
  %eqtmp164 = icmp eq i8 %c163, 66
  %ifcond165 = icmp ne i1 %eqtmp164, false
  br i1 %ifcond165, label %then166, label %ifcont167

then166:                                          ; preds = %ifcont162
  ret i32 66

ifcont167:                                        ; preds = %ifcont162
  %c168 = load i8, ptr %c1, align 1
  %eqtmp169 = icmp eq i8 %c168, 67
  %ifcond170 = icmp ne i1 %eqtmp169, false
  br i1 %ifcond170, label %then171, label %ifcont172

then171:                                          ; preds = %ifcont167
  ret i32 67

ifcont172:                                        ; preds = %ifcont167
  %c173 = load i8, ptr %c1, align 1
  %eqtmp174 = icmp eq i8 %c173, 68
  %ifcond175 = icmp ne i1 %eqtmp174, false
  br i1 %ifcond175, label %then176, label %ifcont177

then176:                                          ; preds = %ifcont172
  ret i32 68

ifcont177:                                        ; preds = %ifcont172
  %c178 = load i8, ptr %c1, align 1
  %eqtmp179 = icmp eq i8 %c178, 69
  %ifcond180 = icmp ne i1 %eqtmp179, false
  br i1 %ifcond180, label %then181, label %ifcont182

then181:                                          ; preds = %ifcont177
  ret i32 69

ifcont182:                                        ; preds = %ifcont177
  %c183 = load i8, ptr %c1, align 1
  %eqtmp184 = icmp eq i8 %c183, 70
  %ifcond185 = icmp ne i1 %eqtmp184, false
  br i1 %ifcond185, label %then186, label %ifcont187

then186:                                          ; preds = %ifcont182
  ret i32 70

ifcont187:                                        ; preds = %ifcont182
  %c188 = load i8, ptr %c1, align 1
  %eqtmp189 = icmp eq i8 %c188, 71
  %ifcond190 = icmp ne i1 %eqtmp189, false
  br i1 %ifcond190, label %then191, label %ifcont192

then191:                                          ; preds = %ifcont187
  ret i32 71

ifcont192:                                        ; preds = %ifcont187
  %c193 = load i8, ptr %c1, align 1
  %eqtmp194 = icmp eq i8 %c193, 72
  %ifcond195 = icmp ne i1 %eqtmp194, false
  br i1 %ifcond195, label %then196, label %ifcont197

then196:                                          ; preds = %ifcont192
  ret i32 72

ifcont197:                                        ; preds = %ifcont192
  %c198 = load i8, ptr %c1, align 1
  %eqtmp199 = icmp eq i8 %c198, 73
  %ifcond200 = icmp ne i1 %eqtmp199, false
  br i1 %ifcond200, label %then201, label %ifcont202

then201:                                          ; preds = %ifcont197
  ret i32 73

ifcont202:                                        ; preds = %ifcont197
  %c203 = load i8, ptr %c1, align 1
  %eqtmp204 = icmp eq i8 %c203, 74
  %ifcond205 = icmp ne i1 %eqtmp204, false
  br i1 %ifcond205, label %then206, label %ifcont207

then206:                                          ; preds = %ifcont202
  ret i32 74

ifcont207:                                        ; preds = %ifcont202
  %c208 = load i8, ptr %c1, align 1
  %eqtmp209 = icmp eq i8 %c208, 75
  %ifcond210 = icmp ne i1 %eqtmp209, false
  br i1 %ifcond210, label %then211, label %ifcont212

then211:                                          ; preds = %ifcont207
  ret i32 75

ifcont212:                                        ; preds = %ifcont207
  %c213 = load i8, ptr %c1, align 1
  %eqtmp214 = icmp eq i8 %c213, 76
  %ifcond215 = icmp ne i1 %eqtmp214, false
  br i1 %ifcond215, label %then216, label %ifcont217

then216:                                          ; preds = %ifcont212
  ret i32 76

ifcont217:                                        ; preds = %ifcont212
  %c218 = load i8, ptr %c1, align 1
  %eqtmp219 = icmp eq i8 %c218, 77
  %ifcond220 = icmp ne i1 %eqtmp219, false
  br i1 %ifcond220, label %then221, label %ifcont222

then221:                                          ; preds = %ifcont217
  ret i32 77

ifcont222:                                        ; preds = %ifcont217
  %c223 = load i8, ptr %c1, align 1
  %eqtmp224 = icmp eq i8 %c223, 78
  %ifcond225 = icmp ne i1 %eqtmp224, false
  br i1 %ifcond225, label %then226, label %ifcont227

then226:                                          ; preds = %ifcont222
  ret i32 78

ifcont227:                                        ; preds = %ifcont222
  %c228 = load i8, ptr %c1, align 1
  %eqtmp229 = icmp eq i8 %c228, 79
  %ifcond230 = icmp ne i1 %eqtmp229, false
  br i1 %ifcond230, label %then231, label %ifcont232

then231:                                          ; preds = %ifcont227
  ret i32 79

ifcont232:                                        ; preds = %ifcont227
  %c233 = load i8, ptr %c1, align 1
  %eqtmp234 = icmp eq i8 %c233, 80
  %ifcond235 = icmp ne i1 %eqtmp234, false
  br i1 %ifcond235, label %then236, label %ifcont237

then236:                                          ; preds = %ifcont232
  ret i32 80

ifcont237:                                        ; preds = %ifcont232
  %c238 = load i8, ptr %c1, align 1
  %eqtmp239 = icmp eq i8 %c238, 81
  %ifcond240 = icmp ne i1 %eqtmp239, false
  br i1 %ifcond240, label %then241, label %ifcont242

then241:                                          ; preds = %ifcont237
  ret i32 81

ifcont242:                                        ; preds = %ifcont237
  %c243 = load i8, ptr %c1, align 1
  %eqtmp244 = icmp eq i8 %c243, 82
  %ifcond245 = icmp ne i1 %eqtmp244, false
  br i1 %ifcond245, label %then246, label %ifcont247

then246:                                          ; preds = %ifcont242
  ret i32 82

ifcont247:                                        ; preds = %ifcont242
  %c248 = load i8, ptr %c1, align 1
  %eqtmp249 = icmp eq i8 %c248, 83
  %ifcond250 = icmp ne i1 %eqtmp249, false
  br i1 %ifcond250, label %then251, label %ifcont252

then251:                                          ; preds = %ifcont247
  ret i32 83

ifcont252:                                        ; preds = %ifcont247
  %c253 = load i8, ptr %c1, align 1
  %eqtmp254 = icmp eq i8 %c253, 84
  %ifcond255 = icmp ne i1 %eqtmp254, false
  br i1 %ifcond255, label %then256, label %ifcont257

then256:                                          ; preds = %ifcont252
  ret i32 84

ifcont257:                                        ; preds = %ifcont252
  %c258 = load i8, ptr %c1, align 1
  %eqtmp259 = icmp eq i8 %c258, 85
  %ifcond260 = icmp ne i1 %eqtmp259, false
  br i1 %ifcond260, label %then261, label %ifcont262

then261:                                          ; preds = %ifcont257
  ret i32 85

ifcont262:                                        ; preds = %ifcont257
  %c263 = load i8, ptr %c1, align 1
  %eqtmp264 = icmp eq i8 %c263, 86
  %ifcond265 = icmp ne i1 %eqtmp264, false
  br i1 %ifcond265, label %then266, label %ifcont267

then266:                                          ; preds = %ifcont262
  ret i32 86

ifcont267:                                        ; preds = %ifcont262
  %c268 = load i8, ptr %c1, align 1
  %eqtmp269 = icmp eq i8 %c268, 87
  %ifcond270 = icmp ne i1 %eqtmp269, false
  br i1 %ifcond270, label %then271, label %ifcont272

then271:                                          ; preds = %ifcont267
  ret i32 87

ifcont272:                                        ; preds = %ifcont267
  %c273 = load i8, ptr %c1, align 1
  %eqtmp274 = icmp eq i8 %c273, 88
  %ifcond275 = icmp ne i1 %eqtmp274, false
  br i1 %ifcond275, label %then276, label %ifcont277

then276:                                          ; preds = %ifcont272
  ret i32 88

ifcont277:                                        ; preds = %ifcont272
  %c278 = load i8, ptr %c1, align 1
  %eqtmp279 = icmp eq i8 %c278, 89
  %ifcond280 = icmp ne i1 %eqtmp279, false
  br i1 %ifcond280, label %then281, label %ifcont282

then281:                                          ; preds = %ifcont277
  ret i32 89

ifcont282:                                        ; preds = %ifcont277
  %c283 = load i8, ptr %c1, align 1
  %eqtmp284 = icmp eq i8 %c283, 90
  %ifcond285 = icmp ne i1 %eqtmp284, false
  br i1 %ifcond285, label %then286, label %ifcont287

then286:                                          ; preds = %ifcont282
  ret i32 90

ifcont287:                                        ; preds = %ifcont282
  %c288 = load i8, ptr %c1, align 1
  %eqtmp289 = icmp eq i8 %c288, 91
  %ifcond290 = icmp ne i1 %eqtmp289, false
  br i1 %ifcond290, label %then291, label %ifcont292

then291:                                          ; preds = %ifcont287
  ret i32 91

ifcont292:                                        ; preds = %ifcont287
  %c293 = load i8, ptr %c1, align 1
  %eqtmp294 = icmp eq i8 %c293, 92
  %ifcond295 = icmp ne i1 %eqtmp294, false
  br i1 %ifcond295, label %then296, label %ifcont297

then296:                                          ; preds = %ifcont292
  ret i32 92

ifcont297:                                        ; preds = %ifcont292
  %c298 = load i8, ptr %c1, align 1
  %eqtmp299 = icmp eq i8 %c298, 93
  %ifcond300 = icmp ne i1 %eqtmp299, false
  br i1 %ifcond300, label %then301, label %ifcont302

then301:                                          ; preds = %ifcont297
  ret i32 93

ifcont302:                                        ; preds = %ifcont297
  %c303 = load i8, ptr %c1, align 1
  %eqtmp304 = icmp eq i8 %c303, 95
  %ifcond305 = icmp ne i1 %eqtmp304, false
  br i1 %ifcond305, label %then306, label %ifcont307

then306:                                          ; preds = %ifcont302
  ret i32 95

ifcont307:                                        ; preds = %ifcont302
  %c308 = load i8, ptr %c1, align 1
  %eqtmp309 = icmp eq i8 %c308, 97
  %ifcond310 = icmp ne i1 %eqtmp309, false
  br i1 %ifcond310, label %then311, label %ifcont312

then311:                                          ; preds = %ifcont307
  ret i32 97

ifcont312:                                        ; preds = %ifcont307
  %c313 = load i8, ptr %c1, align 1
  %eqtmp314 = icmp eq i8 %c313, 98
  %ifcond315 = icmp ne i1 %eqtmp314, false
  br i1 %ifcond315, label %then316, label %ifcont317

then316:                                          ; preds = %ifcont312
  ret i32 98

ifcont317:                                        ; preds = %ifcont312
  %c318 = load i8, ptr %c1, align 1
  %eqtmp319 = icmp eq i8 %c318, 99
  %ifcond320 = icmp ne i1 %eqtmp319, false
  br i1 %ifcond320, label %then321, label %ifcont322

then321:                                          ; preds = %ifcont317
  ret i32 99

ifcont322:                                        ; preds = %ifcont317
  %c323 = load i8, ptr %c1, align 1
  %eqtmp324 = icmp eq i8 %c323, 100
  %ifcond325 = icmp ne i1 %eqtmp324, false
  br i1 %ifcond325, label %then326, label %ifcont327

then326:                                          ; preds = %ifcont322
  ret i32 100

ifcont327:                                        ; preds = %ifcont322
  %c328 = load i8, ptr %c1, align 1
  %eqtmp329 = icmp eq i8 %c328, 101
  %ifcond330 = icmp ne i1 %eqtmp329, false
  br i1 %ifcond330, label %then331, label %ifcont332

then331:                                          ; preds = %ifcont327
  ret i32 101

ifcont332:                                        ; preds = %ifcont327
  %c333 = load i8, ptr %c1, align 1
  %eqtmp334 = icmp eq i8 %c333, 102
  %ifcond335 = icmp ne i1 %eqtmp334, false
  br i1 %ifcond335, label %then336, label %ifcont337

then336:                                          ; preds = %ifcont332
  ret i32 102

ifcont337:                                        ; preds = %ifcont332
  %c338 = load i8, ptr %c1, align 1
  %eqtmp339 = icmp eq i8 %c338, 103
  %ifcond340 = icmp ne i1 %eqtmp339, false
  br i1 %ifcond340, label %then341, label %ifcont342

then341:                                          ; preds = %ifcont337
  ret i32 103

ifcont342:                                        ; preds = %ifcont337
  %c343 = load i8, ptr %c1, align 1
  %eqtmp344 = icmp eq i8 %c343, 104
  %ifcond345 = icmp ne i1 %eqtmp344, false
  br i1 %ifcond345, label %then346, label %ifcont347

then346:                                          ; preds = %ifcont342
  ret i32 104

ifcont347:                                        ; preds = %ifcont342
  %c348 = load i8, ptr %c1, align 1
  %eqtmp349 = icmp eq i8 %c348, 105
  %ifcond350 = icmp ne i1 %eqtmp349, false
  br i1 %ifcond350, label %then351, label %ifcont352

then351:                                          ; preds = %ifcont347
  ret i32 105

ifcont352:                                        ; preds = %ifcont347
  %c353 = load i8, ptr %c1, align 1
  %eqtmp354 = icmp eq i8 %c353, 106
  %ifcond355 = icmp ne i1 %eqtmp354, false
  br i1 %ifcond355, label %then356, label %ifcont357

then356:                                          ; preds = %ifcont352
  ret i32 106

ifcont357:                                        ; preds = %ifcont352
  %c358 = load i8, ptr %c1, align 1
  %eqtmp359 = icmp eq i8 %c358, 107
  %ifcond360 = icmp ne i1 %eqtmp359, false
  br i1 %ifcond360, label %then361, label %ifcont362

then361:                                          ; preds = %ifcont357
  ret i32 107

ifcont362:                                        ; preds = %ifcont357
  %c363 = load i8, ptr %c1, align 1
  %eqtmp364 = icmp eq i8 %c363, 108
  %ifcond365 = icmp ne i1 %eqtmp364, false
  br i1 %ifcond365, label %then366, label %ifcont367

then366:                                          ; preds = %ifcont362
  ret i32 108

ifcont367:                                        ; preds = %ifcont362
  %c368 = load i8, ptr %c1, align 1
  %eqtmp369 = icmp eq i8 %c368, 109
  %ifcond370 = icmp ne i1 %eqtmp369, false
  br i1 %ifcond370, label %then371, label %ifcont372

then371:                                          ; preds = %ifcont367
  ret i32 109

ifcont372:                                        ; preds = %ifcont367
  %c373 = load i8, ptr %c1, align 1
  %eqtmp374 = icmp eq i8 %c373, 110
  %ifcond375 = icmp ne i1 %eqtmp374, false
  br i1 %ifcond375, label %then376, label %ifcont377

then376:                                          ; preds = %ifcont372
  ret i32 110

ifcont377:                                        ; preds = %ifcont372
  %c378 = load i8, ptr %c1, align 1
  %eqtmp379 = icmp eq i8 %c378, 111
  %ifcond380 = icmp ne i1 %eqtmp379, false
  br i1 %ifcond380, label %then381, label %ifcont382

then381:                                          ; preds = %ifcont377
  ret i32 111

ifcont382:                                        ; preds = %ifcont377
  %c383 = load i8, ptr %c1, align 1
  %eqtmp384 = icmp eq i8 %c383, 112
  %ifcond385 = icmp ne i1 %eqtmp384, false
  br i1 %ifcond385, label %then386, label %ifcont387

then386:                                          ; preds = %ifcont382
  ret i32 112

ifcont387:                                        ; preds = %ifcont382
  %c388 = load i8, ptr %c1, align 1
  %eqtmp389 = icmp eq i8 %c388, 113
  %ifcond390 = icmp ne i1 %eqtmp389, false
  br i1 %ifcond390, label %then391, label %ifcont392

then391:                                          ; preds = %ifcont387
  ret i32 113

ifcont392:                                        ; preds = %ifcont387
  %c393 = load i8, ptr %c1, align 1
  %eqtmp394 = icmp eq i8 %c393, 114
  %ifcond395 = icmp ne i1 %eqtmp394, false
  br i1 %ifcond395, label %then396, label %ifcont397

then396:                                          ; preds = %ifcont392
  ret i32 114

ifcont397:                                        ; preds = %ifcont392
  %c398 = load i8, ptr %c1, align 1
  %eqtmp399 = icmp eq i8 %c398, 115
  %ifcond400 = icmp ne i1 %eqtmp399, false
  br i1 %ifcond400, label %then401, label %ifcont402

then401:                                          ; preds = %ifcont397
  ret i32 115

ifcont402:                                        ; preds = %ifcont397
  %c403 = load i8, ptr %c1, align 1
  %eqtmp404 = icmp eq i8 %c403, 116
  %ifcond405 = icmp ne i1 %eqtmp404, false
  br i1 %ifcond405, label %then406, label %ifcont407

then406:                                          ; preds = %ifcont402
  ret i32 116

ifcont407:                                        ; preds = %ifcont402
  %c408 = load i8, ptr %c1, align 1
  %eqtmp409 = icmp eq i8 %c408, 117
  %ifcond410 = icmp ne i1 %eqtmp409, false
  br i1 %ifcond410, label %then411, label %ifcont412

then411:                                          ; preds = %ifcont407
  ret i32 117

ifcont412:                                        ; preds = %ifcont407
  %c413 = load i8, ptr %c1, align 1
  %eqtmp414 = icmp eq i8 %c413, 118
  %ifcond415 = icmp ne i1 %eqtmp414, false
  br i1 %ifcond415, label %then416, label %ifcont417

then416:                                          ; preds = %ifcont412
  ret i32 118

ifcont417:                                        ; preds = %ifcont412
  %c418 = load i8, ptr %c1, align 1
  %eqtmp419 = icmp eq i8 %c418, 119
  %ifcond420 = icmp ne i1 %eqtmp419, false
  br i1 %ifcond420, label %then421, label %ifcont422

then421:                                          ; preds = %ifcont417
  ret i32 119

ifcont422:                                        ; preds = %ifcont417
  %c423 = load i8, ptr %c1, align 1
  %eqtmp424 = icmp eq i8 %c423, 120
  %ifcond425 = icmp ne i1 %eqtmp424, false
  br i1 %ifcond425, label %then426, label %ifcont427

then426:                                          ; preds = %ifcont422
  ret i32 120

ifcont427:                                        ; preds = %ifcont422
  %c428 = load i8, ptr %c1, align 1
  %eqtmp429 = icmp eq i8 %c428, 121
  %ifcond430 = icmp ne i1 %eqtmp429, false
  br i1 %ifcond430, label %then431, label %ifcont432

then431:                                          ; preds = %ifcont427
  ret i32 121

ifcont432:                                        ; preds = %ifcont427
  %c433 = load i8, ptr %c1, align 1
  %eqtmp434 = icmp eq i8 %c433, 122
  %ifcond435 = icmp ne i1 %eqtmp434, false
  br i1 %ifcond435, label %then436, label %ifcont437

then436:                                          ; preds = %ifcont432
  ret i32 122

ifcont437:                                        ; preds = %ifcont432
  %c438 = load i8, ptr %c1, align 1
  %eqtmp439 = icmp eq i8 %c438, 123
  %ifcond440 = icmp ne i1 %eqtmp439, false
  br i1 %ifcond440, label %then441, label %ifcont442

then441:                                          ; preds = %ifcont437
  ret i32 123

ifcont442:                                        ; preds = %ifcont437
  %c443 = load i8, ptr %c1, align 1
  %eqtmp444 = icmp eq i8 %c443, 124
  %ifcond445 = icmp ne i1 %eqtmp444, false
  br i1 %ifcond445, label %then446, label %ifcont447

then446:                                          ; preds = %ifcont442
  ret i32 124

ifcont447:                                        ; preds = %ifcont442
  %c448 = load i8, ptr %c1, align 1
  %eqtmp449 = icmp eq i8 %c448, 125
  %ifcond450 = icmp ne i1 %eqtmp449, false
  br i1 %ifcond450, label %then451, label %ifcont452

then451:                                          ; preds = %ifcont447
  ret i32 125

ifcont452:                                        ; preds = %ifcont447
  ret i32 0
}

define i1 @is_keyword(ptr %s) {
entry:
  %s1 = alloca ptr, align 8
  store ptr %s, ptr %s1, align 8
  %s2 = load ptr, ptr %s1, align 8
  %calltmp = call i32 @str_equals(ptr %s2, ptr @.str.13)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %s3 = load ptr, ptr %s1, align 8
  %calltmp4 = call i32 @str_equals(ptr %s3, ptr @.str.14)
  %eqtmp5 = icmp eq i32 %calltmp4, 1
  %ifcond6 = icmp ne i1 %eqtmp5, false
  br i1 %ifcond6, label %then7, label %ifcont8

then7:                                            ; preds = %ifcont
  ret i1 true

ifcont8:                                          ; preds = %ifcont
  %s9 = load ptr, ptr %s1, align 8
  %calltmp10 = call i32 @str_equals(ptr %s9, ptr @.str.15)
  %eqtmp11 = icmp eq i32 %calltmp10, 1
  %ifcond12 = icmp ne i1 %eqtmp11, false
  br i1 %ifcond12, label %then13, label %ifcont14

then13:                                           ; preds = %ifcont8
  ret i1 true

ifcont14:                                         ; preds = %ifcont8
  %s15 = load ptr, ptr %s1, align 8
  %calltmp16 = call i32 @str_equals(ptr %s15, ptr @.str.16)
  %eqtmp17 = icmp eq i32 %calltmp16, 1
  %ifcond18 = icmp ne i1 %eqtmp17, false
  br i1 %ifcond18, label %then19, label %ifcont20

then19:                                           ; preds = %ifcont14
  ret i1 true

ifcont20:                                         ; preds = %ifcont14
  %s21 = load ptr, ptr %s1, align 8
  %calltmp22 = call i32 @str_equals(ptr %s21, ptr @.str.17)
  %eqtmp23 = icmp eq i32 %calltmp22, 1
  %ifcond24 = icmp ne i1 %eqtmp23, false
  br i1 %ifcond24, label %then25, label %ifcont26

then25:                                           ; preds = %ifcont20
  ret i1 true

ifcont26:                                         ; preds = %ifcont20
  %s27 = load ptr, ptr %s1, align 8
  %calltmp28 = call i32 @str_equals(ptr %s27, ptr @.str.18)
  %eqtmp29 = icmp eq i32 %calltmp28, 1
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %ifcont32

then31:                                           ; preds = %ifcont26
  ret i1 true

ifcont32:                                         ; preds = %ifcont26
  %s33 = load ptr, ptr %s1, align 8
  %calltmp34 = call i32 @str_equals(ptr %s33, ptr @.str.19)
  %eqtmp35 = icmp eq i32 %calltmp34, 1
  %ifcond36 = icmp ne i1 %eqtmp35, false
  br i1 %ifcond36, label %then37, label %ifcont38

then37:                                           ; preds = %ifcont32
  ret i1 true

ifcont38:                                         ; preds = %ifcont32
  %s39 = load ptr, ptr %s1, align 8
  %calltmp40 = call i32 @str_equals(ptr %s39, ptr @.str.20)
  %eqtmp41 = icmp eq i32 %calltmp40, 1
  %ifcond42 = icmp ne i1 %eqtmp41, false
  br i1 %ifcond42, label %then43, label %ifcont44

then43:                                           ; preds = %ifcont38
  ret i1 true

ifcont44:                                         ; preds = %ifcont38
  %s45 = load ptr, ptr %s1, align 8
  %calltmp46 = call i32 @str_equals(ptr %s45, ptr @.str.21)
  %eqtmp47 = icmp eq i32 %calltmp46, 1
  %ifcond48 = icmp ne i1 %eqtmp47, false
  br i1 %ifcond48, label %then49, label %ifcont50

then49:                                           ; preds = %ifcont44
  ret i1 true

ifcont50:                                         ; preds = %ifcont44
  %s51 = load ptr, ptr %s1, align 8
  %calltmp52 = call i32 @str_equals(ptr %s51, ptr @.str.22)
  %eqtmp53 = icmp eq i32 %calltmp52, 1
  %ifcond54 = icmp ne i1 %eqtmp53, false
  br i1 %ifcond54, label %then55, label %ifcont56

then55:                                           ; preds = %ifcont50
  ret i1 true

ifcont56:                                         ; preds = %ifcont50
  %s57 = load ptr, ptr %s1, align 8
  %calltmp58 = call i32 @str_equals(ptr %s57, ptr @.str.23)
  %eqtmp59 = icmp eq i32 %calltmp58, 1
  %ifcond60 = icmp ne i1 %eqtmp59, false
  br i1 %ifcond60, label %then61, label %ifcont62

then61:                                           ; preds = %ifcont56
  ret i1 true

ifcont62:                                         ; preds = %ifcont56
  %s63 = load ptr, ptr %s1, align 8
  %calltmp64 = call i32 @str_equals(ptr %s63, ptr @.str.24)
  %eqtmp65 = icmp eq i32 %calltmp64, 1
  %ifcond66 = icmp ne i1 %eqtmp65, false
  br i1 %ifcond66, label %then67, label %ifcont68

then67:                                           ; preds = %ifcont62
  ret i1 true

ifcont68:                                         ; preds = %ifcont62
  %s69 = load ptr, ptr %s1, align 8
  %calltmp70 = call i32 @str_equals(ptr %s69, ptr @.str.25)
  %eqtmp71 = icmp eq i32 %calltmp70, 1
  %ifcond72 = icmp ne i1 %eqtmp71, false
  br i1 %ifcond72, label %then73, label %ifcont74

then73:                                           ; preds = %ifcont68
  ret i1 true

ifcont74:                                         ; preds = %ifcont68
  %s75 = load ptr, ptr %s1, align 8
  %calltmp76 = call i32 @str_equals(ptr %s75, ptr @.str.26)
  %eqtmp77 = icmp eq i32 %calltmp76, 1
  %ifcond78 = icmp ne i1 %eqtmp77, false
  br i1 %ifcond78, label %then79, label %ifcont80

then79:                                           ; preds = %ifcont74
  ret i1 true

ifcont80:                                         ; preds = %ifcont74
  %s81 = load ptr, ptr %s1, align 8
  %calltmp82 = call i32 @str_equals(ptr %s81, ptr @.str.27)
  %eqtmp83 = icmp eq i32 %calltmp82, 1
  %ifcond84 = icmp ne i1 %eqtmp83, false
  br i1 %ifcond84, label %then85, label %ifcont86

then85:                                           ; preds = %ifcont80
  ret i1 true

ifcont86:                                         ; preds = %ifcont80
  %s87 = load ptr, ptr %s1, align 8
  %calltmp88 = call i32 @str_equals(ptr %s87, ptr @.str.28)
  %eqtmp89 = icmp eq i32 %calltmp88, 1
  %ifcond90 = icmp ne i1 %eqtmp89, false
  br i1 %ifcond90, label %then91, label %ifcont92

then91:                                           ; preds = %ifcont86
  ret i1 true

ifcont92:                                         ; preds = %ifcont86
  %s93 = load ptr, ptr %s1, align 8
  %calltmp94 = call i32 @str_equals(ptr %s93, ptr @.str.29)
  %eqtmp95 = icmp eq i32 %calltmp94, 1
  %ifcond96 = icmp ne i1 %eqtmp95, false
  br i1 %ifcond96, label %then97, label %ifcont98

then97:                                           ; preds = %ifcont92
  ret i1 true

ifcont98:                                         ; preds = %ifcont92
  %s99 = load ptr, ptr %s1, align 8
  %calltmp100 = call i32 @str_equals(ptr %s99, ptr @.str.30)
  %eqtmp101 = icmp eq i32 %calltmp100, 1
  %ifcond102 = icmp ne i1 %eqtmp101, false
  br i1 %ifcond102, label %then103, label %ifcont104

then103:                                          ; preds = %ifcont98
  ret i1 true

ifcont104:                                        ; preds = %ifcont98
  %s105 = load ptr, ptr %s1, align 8
  %calltmp106 = call i32 @str_equals(ptr %s105, ptr @.str.31)
  %eqtmp107 = icmp eq i32 %calltmp106, 1
  %ifcond108 = icmp ne i1 %eqtmp107, false
  br i1 %ifcond108, label %then109, label %ifcont110

then109:                                          ; preds = %ifcont104
  ret i1 true

ifcont110:                                        ; preds = %ifcont104
  %s111 = load ptr, ptr %s1, align 8
  %calltmp112 = call i32 @str_equals(ptr %s111, ptr @.str.32)
  %eqtmp113 = icmp eq i32 %calltmp112, 1
  %ifcond114 = icmp ne i1 %eqtmp113, false
  br i1 %ifcond114, label %then115, label %ifcont116

then115:                                          ; preds = %ifcont110
  ret i1 true

ifcont116:                                        ; preds = %ifcont110
  %s117 = load ptr, ptr %s1, align 8
  %calltmp118 = call i32 @str_equals(ptr %s117, ptr @.str.33)
  %eqtmp119 = icmp eq i32 %calltmp118, 1
  %ifcond120 = icmp ne i1 %eqtmp119, false
  br i1 %ifcond120, label %then121, label %ifcont122

then121:                                          ; preds = %ifcont116
  ret i1 true

ifcont122:                                        ; preds = %ifcont116
  %s123 = load ptr, ptr %s1, align 8
  %calltmp124 = call i32 @str_equals(ptr %s123, ptr @.str.34)
  %eqtmp125 = icmp eq i32 %calltmp124, 1
  %ifcond126 = icmp ne i1 %eqtmp125, false
  br i1 %ifcond126, label %then127, label %ifcont128

then127:                                          ; preds = %ifcont122
  ret i1 true

ifcont128:                                        ; preds = %ifcont122
  %s129 = load ptr, ptr %s1, align 8
  %calltmp130 = call i32 @str_equals(ptr %s129, ptr @.str.35)
  %eqtmp131 = icmp eq i32 %calltmp130, 1
  %ifcond132 = icmp ne i1 %eqtmp131, false
  br i1 %ifcond132, label %then133, label %ifcont134

then133:                                          ; preds = %ifcont128
  ret i1 true

ifcont134:                                        ; preds = %ifcont128
  %s135 = load ptr, ptr %s1, align 8
  %calltmp136 = call i32 @str_equals(ptr %s135, ptr @.str.36)
  %eqtmp137 = icmp eq i32 %calltmp136, 1
  %ifcond138 = icmp ne i1 %eqtmp137, false
  br i1 %ifcond138, label %then139, label %ifcont140

then139:                                          ; preds = %ifcont134
  ret i1 true

ifcont140:                                        ; preds = %ifcont134
  ret i1 false
}

define i1 @is_boolean(ptr %s) {
entry:
  %s1 = alloca ptr, align 8
  store ptr %s, ptr %s1, align 8
  %s2 = load ptr, ptr %s1, align 8
  %calltmp = call i32 @str_equals(ptr %s2, ptr @.str.37)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %s3 = load ptr, ptr %s1, align 8
  %calltmp4 = call i32 @str_equals(ptr %s3, ptr @.str.38)
  %eqtmp5 = icmp eq i32 %calltmp4, 1
  %ifcond6 = icmp ne i1 %eqtmp5, false
  br i1 %ifcond6, label %then7, label %ifcont8

then7:                                            ; preds = %ifcont
  ret i1 true

ifcont8:                                          ; preds = %ifcont
  ret i1 false
}

define ptr @create_lexer(ptr %input) {
entry:
  %input1 = alloca ptr, align 8
  store ptr %input, ptr %input1, align 8
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Lexer, ptr null, i32 1) to i64))
  %input2 = load ptr, ptr %input1, align 8
  %input_ptr = getelementptr inbounds %Lexer, ptr %structmem, i32 0, i32 0
  store ptr %input2, ptr %input_ptr, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structmem, i32 0, i32 1
  store i32 0, ptr %pos_ptr, align 4
  %line_ptr = getelementptr inbounds %Lexer, ptr %structmem, i32 0, i32 2
  store i32 1, ptr %line_ptr, align 4
  %col_ptr = getelementptr inbounds %Lexer, ptr %structmem, i32 0, i32 3
  store i32 1, ptr %col_ptr, align 4
  ret ptr %structmem
}

define i8 @lexer_peek(ptr %lex, i32 %offset) {
entry:
  %offset2 = alloca i32, align 4
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  store i32 %offset, ptr %offset2, align 4
  %structptr = load ptr, ptr %lex1, align 8
  %input_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 0
  %input = load ptr, ptr %input_ptr, align 8
  %structptr3 = load ptr, ptr %lex1, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structptr3, i32 0, i32 1
  %pos = load i32, ptr %pos_ptr, align 4
  %offset4 = load i32, ptr %offset2, align 4
  %addtmp = add i32 %pos, %offset4
  %calltmp = call i8 @str_char_at(ptr %input, i32 %addtmp)
  ret i8 %calltmp
}

define i8 @lexer_current(ptr %lex) {
entry:
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  %structptr = load ptr, ptr %lex1, align 8
  %input_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 0
  %input = load ptr, ptr %input_ptr, align 8
  %structptr2 = load ptr, ptr %lex1, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structptr2, i32 0, i32 1
  %pos = load i32, ptr %pos_ptr, align 4
  %calltmp = call i8 @str_char_at(ptr %input, i32 %pos)
  ret i8 %calltmp
}

define void @lexer_advance(ptr %lex) {
entry:
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  %structptr = load ptr, ptr %lex1, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 1
  %pos = load i32, ptr %pos_ptr, align 4
  %addtmp = add i32 %pos, 1
  %structptr2 = load ptr, ptr %lex1, align 8
  %fieldptr = getelementptr inbounds %Lexer, ptr %structptr2, i32 0, i32 1
  store i32 %addtmp, ptr %fieldptr, align 4
  %structptr3 = load ptr, ptr %lex1, align 8
  %col_ptr = getelementptr inbounds %Lexer, ptr %structptr3, i32 0, i32 3
  %col = load i32, ptr %col_ptr, align 4
  %addtmp4 = add i32 %col, 1
  %structptr5 = load ptr, ptr %lex1, align 8
  %fieldptr6 = getelementptr inbounds %Lexer, ptr %structptr5, i32 0, i32 3
  store i32 %addtmp4, ptr %fieldptr6, align 4
  ret void
}

define void @lexer_skip_whitespace(ptr %lex) {
entry:
  %is_looping = alloca i1, align 1
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont32, %entry
  %is_looping2 = load i1, ptr %is_looping, align 1
  br i1 %is_looping2, label %whilebody, label %afterwhile33

whilebody:                                        ; preds = %whilecond
  %lex3 = load ptr, ptr %lex1, align 8
  %calltmp = call i8 @lexer_current(ptr %lex3)
  %calltmp4 = call i1 @is_space(i8 %calltmp)
  %ifcond = icmp ne i1 %calltmp4, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %lex5 = load ptr, ptr %lex1, align 8
  %calltmp6 = call i8 @lexer_current(ptr %lex5)
  %eqtmp = icmp eq i8 %calltmp6, 10
  %ifcond7 = icmp ne i1 %eqtmp, false
  br i1 %ifcond7, label %then8, label %ifcont

then8:                                            ; preds = %then
  %structptr = load ptr, ptr %lex1, align 8
  %line_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 2
  %line = load i32, ptr %line_ptr, align 4
  %addtmp = add i32 %line, 1
  %structptr9 = load ptr, ptr %lex1, align 8
  %fieldptr = getelementptr inbounds %Lexer, ptr %structptr9, i32 0, i32 2
  store i32 %addtmp, ptr %fieldptr, align 4
  %structptr10 = load ptr, ptr %lex1, align 8
  %fieldptr11 = getelementptr inbounds %Lexer, ptr %structptr10, i32 0, i32 3
  store i32 0, ptr %fieldptr11, align 4
  br label %ifcont

ifcont:                                           ; preds = %then8, %then
  %lex12 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex12)
  br label %ifcont32

else:                                             ; preds = %whilebody
  %lex13 = load ptr, ptr %lex1, align 8
  %calltmp14 = call i8 @lexer_current(ptr %lex13)
  %eqtmp15 = icmp eq i8 %calltmp14, 47
  %lex16 = load ptr, ptr %lex1, align 8
  %calltmp17 = call i8 @lexer_peek(ptr %lex16, i32 1)
  %eqtmp18 = icmp eq i8 %calltmp17, 47
  %andtmp = and i1 %eqtmp15, %eqtmp18
  %ifcond19 = icmp ne i1 %andtmp, false
  br i1 %ifcond19, label %then20, label %else30

then20:                                           ; preds = %else
  br label %whilecond21

whilecond21:                                      ; preds = %whilebody28, %then20
  %lex22 = load ptr, ptr %lex1, align 8
  %calltmp23 = call i8 @lexer_current(ptr %lex22)
  %neqtmp = icmp ne i8 %calltmp23, 10
  %lex24 = load ptr, ptr %lex1, align 8
  %calltmp25 = call i8 @lexer_current(ptr %lex24)
  %neqtmp26 = icmp ne i8 %calltmp25, 0
  %andtmp27 = and i1 %neqtmp, %neqtmp26
  br i1 %andtmp27, label %whilebody28, label %afterwhile

whilebody28:                                      ; preds = %whilecond21
  %lex29 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex29)
  br label %whilecond21

afterwhile:                                       ; preds = %whilecond21
  br label %ifcont31

else30:                                           ; preds = %else
  store i1 false, ptr %is_looping, align 1
  br label %ifcont31

ifcont31:                                         ; preds = %else30, %afterwhile
  br label %ifcont32

ifcont32:                                         ; preds = %ifcont31, %ifcont
  br label %whilecond

afterwhile33:                                     ; preds = %whilecond
  ret void
}

define ptr @lexer_next_token(ptr %lex) {
entry:
  %val = alloca ptr, align 8
  %type = alloca i32, align 4
  %value335 = alloca ptr, align 8
  %length328 = alloca i32, align 4
  %next = alloca i8, align 1
  %start247 = alloca i32, align 4
  %esc = alloca i8, align 1
  %value_char = alloca i8, align 1
  %value152 = alloca ptr, align 8
  %length145 = alloca i32, align 4
  %start126 = alloca i32, align 4
  %value107 = alloca ptr, align 8
  %length100 = alloca i32, align 4
  %start74 = alloca i32, align 4
  %value = alloca ptr, align 8
  %length = alloca i32, align 4
  %start = alloca i32, align 4
  %c = alloca i8, align 1
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  %lex2 = load ptr, ptr %lex1, align 8
  call void @lexer_skip_whitespace(ptr %lex2)
  %structptr = load ptr, ptr %lex1, align 8
  %pos_ptr = getelementptr inbounds %Lexer, ptr %structptr, i32 0, i32 1
  %pos = load i32, ptr %pos_ptr, align 4
  %structptr3 = load ptr, ptr %lex1, align 8
  %input_ptr = getelementptr inbounds %Lexer, ptr %structptr3, i32 0, i32 0
  %input = load ptr, ptr %input_ptr, align 8
  %calltmp = call i32 @str_length(ptr %input)
  %getmp = icmp sge i32 %pos, %calltmp
  %ifcond = icmp ne i1 %getmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 0
  store i32 18, ptr %type_ptr, align 4
  %value_ptr = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 1
  store ptr @.str.39, ptr %value_ptr, align 8
  %structptr4 = load ptr, ptr %lex1, align 8
  %line_ptr = getelementptr inbounds %Lexer, ptr %structptr4, i32 0, i32 2
  %line = load i32, ptr %line_ptr, align 4
  %line_ptr5 = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 2
  store i32 %line, ptr %line_ptr5, align 4
  %tok_next_ptr = getelementptr inbounds %Token, ptr %structmem, i32 0, i32 3
  store ptr @.str.40, ptr %tok_next_ptr, align 8
  ret ptr %structmem

ifcont:                                           ; preds = %entry
  %lex6 = load ptr, ptr %lex1, align 8
  %calltmp7 = call i8 @lexer_current(ptr %lex6)
  store i8 %calltmp7, ptr %c, align 1
  %c8 = load i8, ptr %c, align 1
  %calltmp9 = call i1 @is_alpha(i8 %c8)
  %ifcond10 = icmp ne i1 %calltmp9, false
  br i1 %ifcond10, label %then11, label %ifcont66

then11:                                           ; preds = %ifcont
  %structptr12 = load ptr, ptr %lex1, align 8
  %pos_ptr13 = getelementptr inbounds %Lexer, ptr %structptr12, i32 0, i32 1
  %pos14 = load i32, ptr %pos_ptr13, align 4
  store i32 %pos14, ptr %start, align 4
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %then11
  %lex15 = load ptr, ptr %lex1, align 8
  %calltmp16 = call i8 @lexer_current(ptr %lex15)
  %calltmp17 = call i1 @is_alnum(i8 %calltmp16)
  br i1 %calltmp17, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %lex18 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex18)
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %structptr19 = load ptr, ptr %lex1, align 8
  %pos_ptr20 = getelementptr inbounds %Lexer, ptr %structptr19, i32 0, i32 1
  %pos21 = load i32, ptr %pos_ptr20, align 4
  %start22 = load i32, ptr %start, align 4
  %subtmp = sub i32 %pos21, %start22
  store i32 %subtmp, ptr %length, align 4
  %structptr23 = load ptr, ptr %lex1, align 8
  %input_ptr24 = getelementptr inbounds %Lexer, ptr %structptr23, i32 0, i32 0
  %input25 = load ptr, ptr %input_ptr24, align 8
  %start26 = load i32, ptr %start, align 4
  %length27 = load i32, ptr %length, align 4
  %calltmp28 = call ptr @str_substring(ptr %input25, i32 %start26, i32 %length27)
  store ptr %calltmp28, ptr %value, align 8
  %value29 = load ptr, ptr %value, align 8
  %calltmp30 = call i1 @is_keyword(ptr %value29)
  %ifcond31 = icmp ne i1 %calltmp30, false
  br i1 %ifcond31, label %then32, label %ifcont56

then32:                                           ; preds = %afterwhile
  %value33 = load ptr, ptr %value, align 8
  %calltmp34 = call i1 @is_boolean(ptr %value33)
  %ifcond35 = icmp ne i1 %calltmp34, false
  br i1 %ifcond35, label %then36, label %ifcont46

then36:                                           ; preds = %then32
  %structmem37 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr38 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 0
  store i32 3, ptr %type_ptr38, align 4
  %value39 = load ptr, ptr %value, align 8
  %value_ptr40 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 1
  store ptr %value39, ptr %value_ptr40, align 8
  %structptr41 = load ptr, ptr %lex1, align 8
  %line_ptr42 = getelementptr inbounds %Lexer, ptr %structptr41, i32 0, i32 2
  %line43 = load i32, ptr %line_ptr42, align 4
  %line_ptr44 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 2
  store i32 %line43, ptr %line_ptr44, align 4
  %tok_next_ptr45 = getelementptr inbounds %Token, ptr %structmem37, i32 0, i32 3
  store ptr @.str.41, ptr %tok_next_ptr45, align 8
  ret ptr %structmem37

ifcont46:                                         ; preds = %then32
  %structmem47 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr48 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 0
  store i32 16, ptr %type_ptr48, align 4
  %value49 = load ptr, ptr %value, align 8
  %value_ptr50 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 1
  store ptr %value49, ptr %value_ptr50, align 8
  %structptr51 = load ptr, ptr %lex1, align 8
  %line_ptr52 = getelementptr inbounds %Lexer, ptr %structptr51, i32 0, i32 2
  %line53 = load i32, ptr %line_ptr52, align 4
  %line_ptr54 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 2
  store i32 %line53, ptr %line_ptr54, align 4
  %tok_next_ptr55 = getelementptr inbounds %Token, ptr %structmem47, i32 0, i32 3
  store ptr @.str.42, ptr %tok_next_ptr55, align 8
  ret ptr %structmem47

ifcont56:                                         ; preds = %afterwhile
  %structmem57 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr58 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 0
  store i32 4, ptr %type_ptr58, align 4
  %value59 = load ptr, ptr %value, align 8
  %value_ptr60 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 1
  store ptr %value59, ptr %value_ptr60, align 8
  %structptr61 = load ptr, ptr %lex1, align 8
  %line_ptr62 = getelementptr inbounds %Lexer, ptr %structptr61, i32 0, i32 2
  %line63 = load i32, ptr %line_ptr62, align 4
  %line_ptr64 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 2
  store i32 %line63, ptr %line_ptr64, align 4
  %tok_next_ptr65 = getelementptr inbounds %Token, ptr %structmem57, i32 0, i32 3
  store ptr @.str.43, ptr %tok_next_ptr65, align 8
  ret ptr %structmem57

ifcont66:                                         ; preds = %ifcont
  %c67 = load i8, ptr %c, align 1
  %calltmp68 = call i1 @is_digit(i8 %c67)
  %ifcond69 = icmp ne i1 %calltmp68, false
  br i1 %ifcond69, label %then70, label %ifcont117

then70:                                           ; preds = %ifcont66
  %structptr71 = load ptr, ptr %lex1, align 8
  %pos_ptr72 = getelementptr inbounds %Lexer, ptr %structptr71, i32 0, i32 1
  %pos73 = load i32, ptr %pos_ptr72, align 4
  store i32 %pos73, ptr %start74, align 4
  br label %whilecond75

whilecond75:                                      ; preds = %whilebody79, %then70
  %lex76 = load ptr, ptr %lex1, align 8
  %calltmp77 = call i8 @lexer_current(ptr %lex76)
  %calltmp78 = call i1 @is_digit(i8 %calltmp77)
  br i1 %calltmp78, label %whilebody79, label %afterwhile81

whilebody79:                                      ; preds = %whilecond75
  %lex80 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex80)
  br label %whilecond75

afterwhile81:                                     ; preds = %whilecond75
  %lex82 = load ptr, ptr %lex1, align 8
  %calltmp83 = call i8 @lexer_current(ptr %lex82)
  %eqtmp = icmp eq i8 %calltmp83, 46
  %ifcond84 = icmp ne i1 %eqtmp, false
  br i1 %ifcond84, label %then85, label %ifcont94

then85:                                           ; preds = %afterwhile81
  %lex86 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex86)
  br label %whilecond87

whilecond87:                                      ; preds = %whilebody91, %then85
  %lex88 = load ptr, ptr %lex1, align 8
  %calltmp89 = call i8 @lexer_current(ptr %lex88)
  %calltmp90 = call i1 @is_digit(i8 %calltmp89)
  br i1 %calltmp90, label %whilebody91, label %afterwhile93

whilebody91:                                      ; preds = %whilecond87
  %lex92 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex92)
  br label %whilecond87

afterwhile93:                                     ; preds = %whilecond87
  br label %ifcont94

ifcont94:                                         ; preds = %afterwhile93, %afterwhile81
  %structptr95 = load ptr, ptr %lex1, align 8
  %pos_ptr96 = getelementptr inbounds %Lexer, ptr %structptr95, i32 0, i32 1
  %pos97 = load i32, ptr %pos_ptr96, align 4
  %start98 = load i32, ptr %start74, align 4
  %subtmp99 = sub i32 %pos97, %start98
  store i32 %subtmp99, ptr %length100, align 4
  %structptr101 = load ptr, ptr %lex1, align 8
  %input_ptr102 = getelementptr inbounds %Lexer, ptr %structptr101, i32 0, i32 0
  %input103 = load ptr, ptr %input_ptr102, align 8
  %start104 = load i32, ptr %start74, align 4
  %length105 = load i32, ptr %length100, align 4
  %calltmp106 = call ptr @str_substring(ptr %input103, i32 %start104, i32 %length105)
  store ptr %calltmp106, ptr %value107, align 8
  %structmem108 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr109 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 0
  store i32 2, ptr %type_ptr109, align 4
  %value110 = load ptr, ptr %value107, align 8
  %value_ptr111 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 1
  store ptr %value110, ptr %value_ptr111, align 8
  %structptr112 = load ptr, ptr %lex1, align 8
  %line_ptr113 = getelementptr inbounds %Lexer, ptr %structptr112, i32 0, i32 2
  %line114 = load i32, ptr %line_ptr113, align 4
  %line_ptr115 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 2
  store i32 %line114, ptr %line_ptr115, align 4
  %tok_next_ptr116 = getelementptr inbounds %Token, ptr %structmem108, i32 0, i32 3
  store ptr @.str.44, ptr %tok_next_ptr116, align 8
  ret ptr %structmem108

ifcont117:                                        ; preds = %ifcont66
  %c118 = load i8, ptr %c, align 1
  %eqtmp119 = icmp eq i8 %c118, 34
  %ifcond120 = icmp ne i1 %eqtmp119, false
  br i1 %ifcond120, label %then121, label %ifcont169

then121:                                          ; preds = %ifcont117
  %lex122 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex122)
  %structptr123 = load ptr, ptr %lex1, align 8
  %pos_ptr124 = getelementptr inbounds %Lexer, ptr %structptr123, i32 0, i32 1
  %pos125 = load i32, ptr %pos_ptr124, align 4
  store i32 %pos125, ptr %start126, align 4
  br label %whilecond127

whilecond127:                                     ; preds = %whilebody137, %then121
  %lex128 = load ptr, ptr %lex1, align 8
  %calltmp129 = call i8 @lexer_current(ptr %lex128)
  %neqtmp = icmp ne i8 %calltmp129, 34
  %structptr130 = load ptr, ptr %lex1, align 8
  %pos_ptr131 = getelementptr inbounds %Lexer, ptr %structptr130, i32 0, i32 1
  %pos132 = load i32, ptr %pos_ptr131, align 4
  %structptr133 = load ptr, ptr %lex1, align 8
  %input_ptr134 = getelementptr inbounds %Lexer, ptr %structptr133, i32 0, i32 0
  %input135 = load ptr, ptr %input_ptr134, align 8
  %calltmp136 = call i32 @str_length(ptr %input135)
  %lttmp = icmp slt i32 %pos132, %calltmp136
  %andtmp = and i1 %neqtmp, %lttmp
  br i1 %andtmp, label %whilebody137, label %afterwhile139

whilebody137:                                     ; preds = %whilecond127
  %lex138 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex138)
  br label %whilecond127

afterwhile139:                                    ; preds = %whilecond127
  %structptr140 = load ptr, ptr %lex1, align 8
  %pos_ptr141 = getelementptr inbounds %Lexer, ptr %structptr140, i32 0, i32 1
  %pos142 = load i32, ptr %pos_ptr141, align 4
  %start143 = load i32, ptr %start126, align 4
  %subtmp144 = sub i32 %pos142, %start143
  store i32 %subtmp144, ptr %length145, align 4
  %structptr146 = load ptr, ptr %lex1, align 8
  %input_ptr147 = getelementptr inbounds %Lexer, ptr %structptr146, i32 0, i32 0
  %input148 = load ptr, ptr %input_ptr147, align 8
  %start149 = load i32, ptr %start126, align 4
  %length150 = load i32, ptr %length145, align 4
  %calltmp151 = call ptr @str_substring(ptr %input148, i32 %start149, i32 %length150)
  store ptr %calltmp151, ptr %value152, align 8
  %lex153 = load ptr, ptr %lex1, align 8
  %calltmp154 = call i8 @lexer_current(ptr %lex153)
  %eqtmp155 = icmp eq i8 %calltmp154, 34
  %ifcond156 = icmp ne i1 %eqtmp155, false
  br i1 %ifcond156, label %then157, label %ifcont159

then157:                                          ; preds = %afterwhile139
  %lex158 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex158)
  br label %ifcont159

ifcont159:                                        ; preds = %then157, %afterwhile139
  %structmem160 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr161 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 0
  store i32 0, ptr %type_ptr161, align 4
  %value162 = load ptr, ptr %value152, align 8
  %value_ptr163 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 1
  store ptr %value162, ptr %value_ptr163, align 8
  %structptr164 = load ptr, ptr %lex1, align 8
  %line_ptr165 = getelementptr inbounds %Lexer, ptr %structptr164, i32 0, i32 2
  %line166 = load i32, ptr %line_ptr165, align 4
  %line_ptr167 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 2
  store i32 %line166, ptr %line_ptr167, align 4
  %tok_next_ptr168 = getelementptr inbounds %Token, ptr %structmem160, i32 0, i32 3
  store ptr @.str.45, ptr %tok_next_ptr168, align 8
  ret ptr %structmem160

ifcont169:                                        ; preds = %ifcont117
  %c170 = load i8, ptr %c, align 1
  %eqtmp171 = icmp eq i8 %c170, 39
  %ifcond172 = icmp ne i1 %eqtmp171, false
  br i1 %ifcond172, label %then173, label %ifcont239

then173:                                          ; preds = %ifcont169
  %lex174 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex174)
  %lex175 = load ptr, ptr %lex1, align 8
  %calltmp176 = call i8 @lexer_current(ptr %lex175)
  store i8 %calltmp176, ptr %value_char, align 1
  %value_char177 = load i8, ptr %value_char, align 1
  %eqtmp178 = icmp eq i8 %value_char177, 92
  %ifcond179 = icmp ne i1 %eqtmp178, false
  br i1 %ifcond179, label %then180, label %ifcont219

then180:                                          ; preds = %then173
  %lex181 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex181)
  %lex182 = load ptr, ptr %lex1, align 8
  %calltmp183 = call i8 @lexer_current(ptr %lex182)
  store i8 %calltmp183, ptr %esc, align 1
  %esc184 = load i8, ptr %esc, align 1
  %eqtmp185 = icmp eq i8 %esc184, 110
  %ifcond186 = icmp ne i1 %eqtmp185, false
  br i1 %ifcond186, label %then187, label %ifcont188

then187:                                          ; preds = %then180
  store i8 10, ptr %value_char, align 1
  br label %ifcont188

ifcont188:                                        ; preds = %then187, %then180
  %esc189 = load i8, ptr %esc, align 1
  %eqtmp190 = icmp eq i8 %esc189, 116
  %ifcond191 = icmp ne i1 %eqtmp190, false
  br i1 %ifcond191, label %then192, label %ifcont193

then192:                                          ; preds = %ifcont188
  store i8 9, ptr %value_char, align 1
  br label %ifcont193

ifcont193:                                        ; preds = %then192, %ifcont188
  %esc194 = load i8, ptr %esc, align 1
  %eqtmp195 = icmp eq i8 %esc194, 114
  %ifcond196 = icmp ne i1 %eqtmp195, false
  br i1 %ifcond196, label %then197, label %ifcont198

then197:                                          ; preds = %ifcont193
  store i8 13, ptr %value_char, align 1
  br label %ifcont198

ifcont198:                                        ; preds = %then197, %ifcont193
  %esc199 = load i8, ptr %esc, align 1
  %eqtmp200 = icmp eq i8 %esc199, 48
  %ifcond201 = icmp ne i1 %eqtmp200, false
  br i1 %ifcond201, label %then202, label %ifcont203

then202:                                          ; preds = %ifcont198
  store i8 0, ptr %value_char, align 1
  br label %ifcont203

ifcont203:                                        ; preds = %then202, %ifcont198
  %esc204 = load i8, ptr %esc, align 1
  %eqtmp205 = icmp eq i8 %esc204, 92
  %ifcond206 = icmp ne i1 %eqtmp205, false
  br i1 %ifcond206, label %then207, label %ifcont208

then207:                                          ; preds = %ifcont203
  store i8 92, ptr %value_char, align 1
  br label %ifcont208

ifcont208:                                        ; preds = %then207, %ifcont203
  %esc209 = load i8, ptr %esc, align 1
  %eqtmp210 = icmp eq i8 %esc209, 39
  %ifcond211 = icmp ne i1 %eqtmp210, false
  br i1 %ifcond211, label %then212, label %ifcont213

then212:                                          ; preds = %ifcont208
  store i8 39, ptr %value_char, align 1
  br label %ifcont213

ifcont213:                                        ; preds = %then212, %ifcont208
  %esc214 = load i8, ptr %esc, align 1
  %eqtmp215 = icmp eq i8 %esc214, 34
  %ifcond216 = icmp ne i1 %eqtmp215, false
  br i1 %ifcond216, label %then217, label %ifcont218

then217:                                          ; preds = %ifcont213
  store i8 34, ptr %value_char, align 1
  br label %ifcont218

ifcont218:                                        ; preds = %then217, %ifcont213
  br label %ifcont219

ifcont219:                                        ; preds = %ifcont218, %then173
  %lex220 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex220)
  %lex221 = load ptr, ptr %lex1, align 8
  %calltmp222 = call i8 @lexer_current(ptr %lex221)
  %eqtmp223 = icmp eq i8 %calltmp222, 39
  %ifcond224 = icmp ne i1 %eqtmp223, false
  br i1 %ifcond224, label %then225, label %ifcont227

then225:                                          ; preds = %ifcont219
  %lex226 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex226)
  br label %ifcont227

ifcont227:                                        ; preds = %then225, %ifcont219
  %structmem228 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr229 = getelementptr inbounds %Token, ptr %structmem228, i32 0, i32 0
  store i32 1, ptr %type_ptr229, align 4
  %value_char230 = load i8, ptr %value_char, align 1
  %calltmp231 = call i32 @char_code(i8 %value_char230)
  %calltmp232 = call ptr @int_to_str(i32 %calltmp231)
  %value_ptr233 = getelementptr inbounds %Token, ptr %structmem228, i32 0, i32 1
  store ptr %calltmp232, ptr %value_ptr233, align 8
  %structptr234 = load ptr, ptr %lex1, align 8
  %line_ptr235 = getelementptr inbounds %Lexer, ptr %structptr234, i32 0, i32 2
  %line236 = load i32, ptr %line_ptr235, align 4
  %line_ptr237 = getelementptr inbounds %Token, ptr %structmem228, i32 0, i32 2
  store i32 %line236, ptr %line_ptr237, align 4
  %tok_next_ptr238 = getelementptr inbounds %Token, ptr %structmem228, i32 0, i32 3
  store ptr @.str.46, ptr %tok_next_ptr238, align 8
  ret ptr %structmem228

ifcont239:                                        ; preds = %ifcont169
  %c240 = load i8, ptr %c, align 1
  %calltmp241 = call i1 @is_operator(i8 %c240)
  %ifcond242 = icmp ne i1 %calltmp241, false
  br i1 %ifcond242, label %then243, label %ifcont402

then243:                                          ; preds = %ifcont239
  %structptr244 = load ptr, ptr %lex1, align 8
  %pos_ptr245 = getelementptr inbounds %Lexer, ptr %structptr244, i32 0, i32 1
  %pos246 = load i32, ptr %pos_ptr245, align 4
  store i32 %pos246, ptr %start247, align 4
  %lex248 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex248)
  %lex249 = load ptr, ptr %lex1, align 8
  %calltmp250 = call i8 @lexer_current(ptr %lex249)
  store i8 %calltmp250, ptr %next, align 1
  %c251 = load i8, ptr %c, align 1
  %eqtmp252 = icmp eq i8 %c251, 61
  %next253 = load i8, ptr %next, align 1
  %eqtmp254 = icmp eq i8 %next253, 61
  %andtmp255 = and i1 %eqtmp252, %eqtmp254
  %ifcond256 = icmp ne i1 %andtmp255, false
  br i1 %ifcond256, label %then257, label %ifcont259

then257:                                          ; preds = %then243
  %lex258 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex258)
  br label %ifcont259

ifcont259:                                        ; preds = %then257, %then243
  %c260 = load i8, ptr %c, align 1
  %eqtmp261 = icmp eq i8 %c260, 33
  %next262 = load i8, ptr %next, align 1
  %eqtmp263 = icmp eq i8 %next262, 61
  %andtmp264 = and i1 %eqtmp261, %eqtmp263
  %ifcond265 = icmp ne i1 %andtmp264, false
  br i1 %ifcond265, label %then266, label %ifcont268

then266:                                          ; preds = %ifcont259
  %lex267 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex267)
  br label %ifcont268

ifcont268:                                        ; preds = %then266, %ifcont259
  %c269 = load i8, ptr %c, align 1
  %eqtmp270 = icmp eq i8 %c269, 60
  %next271 = load i8, ptr %next, align 1
  %eqtmp272 = icmp eq i8 %next271, 61
  %andtmp273 = and i1 %eqtmp270, %eqtmp272
  %ifcond274 = icmp ne i1 %andtmp273, false
  br i1 %ifcond274, label %then275, label %ifcont277

then275:                                          ; preds = %ifcont268
  %lex276 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex276)
  br label %ifcont277

ifcont277:                                        ; preds = %then275, %ifcont268
  %c278 = load i8, ptr %c, align 1
  %eqtmp279 = icmp eq i8 %c278, 62
  %next280 = load i8, ptr %next, align 1
  %eqtmp281 = icmp eq i8 %next280, 61
  %andtmp282 = and i1 %eqtmp279, %eqtmp281
  %ifcond283 = icmp ne i1 %andtmp282, false
  br i1 %ifcond283, label %then284, label %ifcont286

then284:                                          ; preds = %ifcont277
  %lex285 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex285)
  br label %ifcont286

ifcont286:                                        ; preds = %then284, %ifcont277
  %c287 = load i8, ptr %c, align 1
  %eqtmp288 = icmp eq i8 %c287, 38
  %next289 = load i8, ptr %next, align 1
  %eqtmp290 = icmp eq i8 %next289, 38
  %andtmp291 = and i1 %eqtmp288, %eqtmp290
  %ifcond292 = icmp ne i1 %andtmp291, false
  br i1 %ifcond292, label %then293, label %ifcont295

then293:                                          ; preds = %ifcont286
  %lex294 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex294)
  br label %ifcont295

ifcont295:                                        ; preds = %then293, %ifcont286
  %c296 = load i8, ptr %c, align 1
  %eqtmp297 = icmp eq i8 %c296, 124
  %next298 = load i8, ptr %next, align 1
  %eqtmp299 = icmp eq i8 %next298, 124
  %andtmp300 = and i1 %eqtmp297, %eqtmp299
  %ifcond301 = icmp ne i1 %andtmp300, false
  br i1 %ifcond301, label %then302, label %ifcont304

then302:                                          ; preds = %ifcont295
  %lex303 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex303)
  br label %ifcont304

ifcont304:                                        ; preds = %then302, %ifcont295
  %c305 = load i8, ptr %c, align 1
  %eqtmp306 = icmp eq i8 %c305, 45
  %next307 = load i8, ptr %next, align 1
  %eqtmp308 = icmp eq i8 %next307, 62
  %andtmp309 = and i1 %eqtmp306, %eqtmp308
  %ifcond310 = icmp ne i1 %andtmp309, false
  br i1 %ifcond310, label %then311, label %ifcont313

then311:                                          ; preds = %ifcont304
  %lex312 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex312)
  br label %ifcont313

ifcont313:                                        ; preds = %then311, %ifcont304
  %c314 = load i8, ptr %c, align 1
  %eqtmp315 = icmp eq i8 %c314, 61
  %next316 = load i8, ptr %next, align 1
  %eqtmp317 = icmp eq i8 %next316, 62
  %andtmp318 = and i1 %eqtmp315, %eqtmp317
  %ifcond319 = icmp ne i1 %andtmp318, false
  br i1 %ifcond319, label %then320, label %ifcont322

then320:                                          ; preds = %ifcont313
  %lex321 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex321)
  br label %ifcont322

ifcont322:                                        ; preds = %then320, %ifcont313
  %structptr323 = load ptr, ptr %lex1, align 8
  %pos_ptr324 = getelementptr inbounds %Lexer, ptr %structptr323, i32 0, i32 1
  %pos325 = load i32, ptr %pos_ptr324, align 4
  %start326 = load i32, ptr %start247, align 4
  %subtmp327 = sub i32 %pos325, %start326
  store i32 %subtmp327, ptr %length328, align 4
  %structptr329 = load ptr, ptr %lex1, align 8
  %input_ptr330 = getelementptr inbounds %Lexer, ptr %structptr329, i32 0, i32 0
  %input331 = load ptr, ptr %input_ptr330, align 8
  %start332 = load i32, ptr %start247, align 4
  %length333 = load i32, ptr %length328, align 4
  %calltmp334 = call ptr @str_substring(ptr %input331, i32 %start332, i32 %length333)
  store ptr %calltmp334, ptr %value335, align 8
  store i32 7, ptr %type, align 4
  %length336 = load i32, ptr %length328, align 4
  %eqtmp337 = icmp eq i32 %length336, 2
  %ifcond338 = icmp ne i1 %eqtmp337, false
  br i1 %ifcond338, label %then339, label %else

then339:                                          ; preds = %ifcont322
  %value340 = load ptr, ptr %value335, align 8
  %calltmp341 = call i32 @str_equals(ptr %value340, ptr @.str.47)
  %eqtmp342 = icmp eq i32 %calltmp341, 1
  %value343 = load ptr, ptr %value335, align 8
  %calltmp344 = call i32 @str_equals(ptr %value343, ptr @.str.48)
  %eqtmp345 = icmp eq i32 %calltmp344, 1
  %value346 = load ptr, ptr %value335, align 8
  %calltmp347 = call i32 @str_equals(ptr %value346, ptr @.str.49)
  %eqtmp348 = icmp eq i32 %calltmp347, 1
  %value349 = load ptr, ptr %value335, align 8
  %calltmp350 = call i32 @str_equals(ptr %value349, ptr @.str.50)
  %eqtmp351 = icmp eq i32 %calltmp350, 1
  %ortmp = or i1 %eqtmp348, %eqtmp351
  %ortmp352 = or i1 %eqtmp345, %ortmp
  %ortmp353 = or i1 %eqtmp342, %ortmp352
  %ifcond354 = icmp ne i1 %ortmp353, false
  br i1 %ifcond354, label %then355, label %ifcont356

then355:                                          ; preds = %then339
  store i32 8, ptr %type, align 4
  br label %ifcont356

ifcont356:                                        ; preds = %then355, %then339
  %value357 = load ptr, ptr %value335, align 8
  %calltmp358 = call i32 @str_equals(ptr %value357, ptr @.str.51)
  %eqtmp359 = icmp eq i32 %calltmp358, 1
  %value360 = load ptr, ptr %value335, align 8
  %calltmp361 = call i32 @str_equals(ptr %value360, ptr @.str.52)
  %eqtmp362 = icmp eq i32 %calltmp361, 1
  %ortmp363 = or i1 %eqtmp359, %eqtmp362
  %ifcond364 = icmp ne i1 %ortmp363, false
  br i1 %ifcond364, label %then365, label %ifcont372

then365:                                          ; preds = %ifcont356
  store i32 14, ptr %type, align 4
  %value366 = load ptr, ptr %value335, align 8
  %calltmp367 = call i32 @str_equals(ptr %value366, ptr @.str.53)
  %eqtmp368 = icmp eq i32 %calltmp367, 1
  %ifcond369 = icmp ne i1 %eqtmp368, false
  br i1 %ifcond369, label %then370, label %ifcont371

then370:                                          ; preds = %then365
  store i32 15, ptr %type, align 4
  br label %ifcont371

ifcont371:                                        ; preds = %then370, %then365
  br label %ifcont372

ifcont372:                                        ; preds = %ifcont371, %ifcont356
  br label %ifcont391

else:                                             ; preds = %ifcont322
  %c373 = load i8, ptr %c, align 1
  %eqtmp374 = icmp eq i8 %c373, 60
  %c375 = load i8, ptr %c, align 1
  %eqtmp376 = icmp eq i8 %c375, 62
  %ortmp377 = or i1 %eqtmp374, %eqtmp376
  %ifcond378 = icmp ne i1 %ortmp377, false
  br i1 %ifcond378, label %then379, label %ifcont380

then379:                                          ; preds = %else
  store i32 8, ptr %type, align 4
  br label %ifcont380

ifcont380:                                        ; preds = %then379, %else
  %c381 = load i8, ptr %c, align 1
  %eqtmp382 = icmp eq i8 %c381, 61
  %ifcond383 = icmp ne i1 %eqtmp382, false
  br i1 %ifcond383, label %then384, label %ifcont385

then384:                                          ; preds = %ifcont380
  store i32 11, ptr %type, align 4
  br label %ifcont385

ifcont385:                                        ; preds = %then384, %ifcont380
  %c386 = load i8, ptr %c, align 1
  %eqtmp387 = icmp eq i8 %c386, 33
  %ifcond388 = icmp ne i1 %eqtmp387, false
  br i1 %ifcond388, label %then389, label %ifcont390

then389:                                          ; preds = %ifcont385
  store i32 9, ptr %type, align 4
  br label %ifcont390

ifcont390:                                        ; preds = %then389, %ifcont385
  br label %ifcont391

ifcont391:                                        ; preds = %ifcont390, %ifcont372
  %structmem392 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type393 = load i32, ptr %type, align 4
  %type_ptr394 = getelementptr inbounds %Token, ptr %structmem392, i32 0, i32 0
  store i32 %type393, ptr %type_ptr394, align 4
  %value395 = load ptr, ptr %value335, align 8
  %value_ptr396 = getelementptr inbounds %Token, ptr %structmem392, i32 0, i32 1
  store ptr %value395, ptr %value_ptr396, align 8
  %structptr397 = load ptr, ptr %lex1, align 8
  %line_ptr398 = getelementptr inbounds %Lexer, ptr %structptr397, i32 0, i32 2
  %line399 = load i32, ptr %line_ptr398, align 4
  %line_ptr400 = getelementptr inbounds %Token, ptr %structmem392, i32 0, i32 2
  store i32 %line399, ptr %line_ptr400, align 4
  %tok_next_ptr401 = getelementptr inbounds %Token, ptr %structmem392, i32 0, i32 3
  store ptr @.str.54, ptr %tok_next_ptr401, align 8
  ret ptr %structmem392

ifcont402:                                        ; preds = %ifcont239
  %c403 = load i8, ptr %c, align 1
  %calltmp404 = call i1 @is_separator(i8 %c403)
  %ifcond405 = icmp ne i1 %calltmp404, false
  br i1 %ifcond405, label %then406, label %ifcont424

then406:                                          ; preds = %ifcont402
  %structptr407 = load ptr, ptr %lex1, align 8
  %input_ptr408 = getelementptr inbounds %Lexer, ptr %structptr407, i32 0, i32 0
  %input409 = load ptr, ptr %input_ptr408, align 8
  %structptr410 = load ptr, ptr %lex1, align 8
  %pos_ptr411 = getelementptr inbounds %Lexer, ptr %structptr410, i32 0, i32 1
  %pos412 = load i32, ptr %pos_ptr411, align 4
  %calltmp413 = call ptr @str_substring(ptr %input409, i32 %pos412, i32 1)
  store ptr %calltmp413, ptr %val, align 8
  %lex414 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex414)
  %structmem415 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr416 = getelementptr inbounds %Token, ptr %structmem415, i32 0, i32 0
  store i32 5, ptr %type_ptr416, align 4
  %val417 = load ptr, ptr %val, align 8
  %value_ptr418 = getelementptr inbounds %Token, ptr %structmem415, i32 0, i32 1
  store ptr %val417, ptr %value_ptr418, align 8
  %structptr419 = load ptr, ptr %lex1, align 8
  %line_ptr420 = getelementptr inbounds %Lexer, ptr %structptr419, i32 0, i32 2
  %line421 = load i32, ptr %line_ptr420, align 4
  %line_ptr422 = getelementptr inbounds %Token, ptr %structmem415, i32 0, i32 2
  store i32 %line421, ptr %line_ptr422, align 4
  %tok_next_ptr423 = getelementptr inbounds %Token, ptr %structmem415, i32 0, i32 3
  store ptr @.str.55, ptr %tok_next_ptr423, align 8
  ret ptr %structmem415

ifcont424:                                        ; preds = %ifcont402
  %lex425 = load ptr, ptr %lex1, align 8
  call void @lexer_advance(ptr %lex425)
  %structmem426 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Token, ptr null, i32 1) to i64))
  %type_ptr427 = getelementptr inbounds %Token, ptr %structmem426, i32 0, i32 0
  store i32 17, ptr %type_ptr427, align 4
  %value_ptr428 = getelementptr inbounds %Token, ptr %structmem426, i32 0, i32 1
  store ptr @.str.56, ptr %value_ptr428, align 8
  %structptr429 = load ptr, ptr %lex1, align 8
  %line_ptr430 = getelementptr inbounds %Lexer, ptr %structptr429, i32 0, i32 2
  %line431 = load i32, ptr %line_ptr430, align 4
  %line_ptr432 = getelementptr inbounds %Token, ptr %structmem426, i32 0, i32 2
  store i32 %line431, ptr %line_ptr432, align 4
  %tok_next_ptr433 = getelementptr inbounds %Token, ptr %structmem426, i32 0, i32 3
  store ptr @.str.57, ptr %tok_next_ptr433, align 8
  ret ptr %structmem426
}

declare ptr @ptr_to_token(ptr)

declare ptr @token_to_ptr(ptr)

define ptr @lex_all_tokens(ptr %lex) {
entry:
  %next_tok = alloca ptr, align 8
  %current = alloca ptr, align 8
  %head = alloca ptr, align 8
  %lex1 = alloca ptr, align 8
  store ptr %lex, ptr %lex1, align 8
  %lex2 = load ptr, ptr %lex1, align 8
  %calltmp = call ptr @lexer_next_token(ptr %lex2)
  store ptr %calltmp, ptr %head, align 8
  %head3 = load ptr, ptr %head, align 8
  store ptr %head3, ptr %current, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %structptr = load ptr, ptr %current, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %neqtmp = icmp ne i32 %type, 18
  br i1 %neqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %lex4 = load ptr, ptr %lex1, align 8
  %calltmp5 = call ptr @lexer_next_token(ptr %lex4)
  store ptr %calltmp5, ptr %next_tok, align 8
  %next_tok6 = load ptr, ptr %next_tok, align 8
  %calltmp7 = call ptr @token_to_ptr(ptr %next_tok6)
  %structptr8 = load ptr, ptr %current, align 8
  %fieldptr = getelementptr inbounds %Token, ptr %structptr8, i32 0, i32 3
  store ptr %calltmp7, ptr %fieldptr, align 8
  %next_tok9 = load ptr, ptr %next_tok, align 8
  store ptr %next_tok9, ptr %current, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %head10 = load ptr, ptr %head, align 8
  ret ptr %head10
}

declare ptr @ptr_to_node(ptr)

declare ptr @node_to_ptr(ptr)

define ptr @create_node(i32 %kind) {
entry:
  %kind1 = alloca i32, align 4
  store i32 %kind, ptr %kind1, align 4
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%ASTNode, ptr null, i32 1) to i64))
  %kind2 = load i32, ptr %kind1, align 4
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 0
  store i32 %kind2, ptr %kind_ptr, align 4
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 1
  store ptr @.str.58, ptr %s1_ptr, align 8
  %s2_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 2
  store ptr @.str.59, ptr %s2_ptr, align 8
  %i1_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 3
  store i32 0, ptr %i1_ptr, align 4
  %i2_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 4
  store i32 0, ptr %i2_ptr, align 4
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 5
  store ptr @.str.60, ptr %child1_ptr, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 6
  store ptr @.str.61, ptr %child2_ptr, align 8
  %child3_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 7
  store ptr @.str.62, ptr %child3_ptr, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structmem, i32 0, i32 8
  store ptr @.str.63, ptr %next_ptr, align 8
  ret ptr %structmem
}

define ptr @parser_create(ptr %tokens) {
entry:
  %tokens1 = alloca ptr, align 8
  store ptr %tokens, ptr %tokens1, align 8
  %structmem = call ptr @malloc(i64 ptrtoint (ptr getelementptr (%Parser, ptr null, i32 1) to i64))
  %tokens2 = load ptr, ptr %tokens1, align 8
  %calltmp = call ptr @token_to_ptr(ptr %tokens2)
  %current_ptr = getelementptr inbounds %Parser, ptr %structmem, i32 0, i32 0
  store ptr %calltmp, ptr %current_ptr, align 8
  ret ptr %structmem
}

define ptr @parser_current(ptr %p) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %structptr = load ptr, ptr %p1, align 8
  %current_ptr = getelementptr inbounds %Parser, ptr %structptr, i32 0, i32 0
  %current = load ptr, ptr %current_ptr, align 8
  %calltmp = call ptr @ptr_to_token(ptr %current)
  ret ptr %calltmp
}

define ptr @parser_peek(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %structptr = load ptr, ptr %p1, align 8
  %current_ptr = getelementptr inbounds %Parser, ptr %structptr, i32 0, i32 0
  %current = load ptr, ptr %current_ptr, align 8
  %calltmp = call ptr @ptr_to_token(ptr %current)
  store ptr %calltmp, ptr %curr, align 8
  %structptr2 = load ptr, ptr %curr, align 8
  %tok_next_ptr = getelementptr inbounds %Token, ptr %structptr2, i32 0, i32 3
  %tok_next = load ptr, ptr %tok_next_ptr, align 8
  %calltmp3 = call ptr @ptr_to_token(ptr %tok_next)
  ret ptr %calltmp3
}

define void @parser_advance(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %structptr = load ptr, ptr %p1, align 8
  %current_ptr = getelementptr inbounds %Parser, ptr %structptr, i32 0, i32 0
  %current = load ptr, ptr %current_ptr, align 8
  %calltmp = call ptr @ptr_to_token(ptr %current)
  store ptr %calltmp, ptr %curr, align 8
  %structptr2 = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr2, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %neqtmp = icmp ne i32 %type, 18
  %ifcond = icmp ne i1 %neqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structptr3 = load ptr, ptr %curr, align 8
  %tok_next_ptr = getelementptr inbounds %Token, ptr %structptr3, i32 0, i32 3
  %tok_next = load ptr, ptr %tok_next_ptr, align 8
  %structptr4 = load ptr, ptr %p1, align 8
  %fieldptr = getelementptr inbounds %Parser, ptr %structptr4, i32 0, i32 0
  store ptr %tok_next, ptr %fieldptr, align 8
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  ret void
}

define i1 @parser_check(ptr %p, i32 %t) {
entry:
  %curr = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  %p3 = load ptr, ptr %p1, align 8
  %calltmp = call ptr @parser_current(ptr %p3)
  store ptr %calltmp, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %t4 = load i32, ptr %t2, align 4
  %eqtmp = icmp eq i32 %type, %t4
  ret i1 %eqtmp
}

define i1 @parser_check_val(ptr %p, i32 %t, ptr %val) {
entry:
  %curr = alloca ptr, align 8
  %val3 = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  store ptr %val, ptr %val3, align 8
  %p4 = load ptr, ptr %p1, align 8
  %calltmp = call ptr @parser_current(ptr %p4)
  store ptr %calltmp, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %t5 = load i32, ptr %t2, align 4
  %eqtmp = icmp eq i32 %type, %t5
  %structptr6 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr6, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %val7 = load ptr, ptr %val3, align 8
  %calltmp8 = call i32 @str_equals(ptr %value, ptr %val7)
  %eqtmp9 = icmp eq i32 %calltmp8, 1
  %andtmp = and i1 %eqtmp, %eqtmp9
  ret i1 %andtmp
}

define i1 @parser_match(ptr %p, i32 %t) {
entry:
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  %p3 = load ptr, ptr %p1, align 8
  %t4 = load i32, ptr %t2, align 4
  %calltmp = call i1 @parser_check(ptr %p3, i32 %t4)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %p5 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p5)
  ret i1 true

ifcont:                                           ; preds = %entry
  ret i1 false
}

define i1 @parser_match_val(ptr %p, i32 %t, ptr %val) {
entry:
  %val3 = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  store ptr %val, ptr %val3, align 8
  %p4 = load ptr, ptr %p1, align 8
  %t5 = load i32, ptr %t2, align 4
  %val6 = load ptr, ptr %val3, align 8
  %calltmp = call i1 @parser_check_val(ptr %p4, i32 %t5, ptr %val6)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p7)
  ret i1 true

ifcont:                                           ; preds = %entry
  ret i1 false
}

declare void @exit(i32)

define void @parser_expect(ptr %p, i32 %t, ptr %context) {
entry:
  %context3 = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  store ptr %context, ptr %context3, align 8
  %p4 = load ptr, ptr %p1, align 8
  %t5 = load i32, ptr %t2, align 4
  %calltmp = call i1 @parser_check(ptr %p4, i32 %t5)
  %eqtmp = icmp eq i1 %calltmp, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  call void @print(ptr @.str.64)
  %context6 = load ptr, ptr %context3, align 8
  call void @print(ptr %context6)
  call void @print(ptr @.str.65)
  %t7 = load i32, ptr %t2, align 4
  call void @println_int(i32 %t7)
  call void @exit(i32 1)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %p8 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p8)
  ret void
}

define void @parser_expect_val(ptr %p, i32 %t, ptr %val, ptr %context) {
entry:
  %context4 = alloca ptr, align 8
  %val3 = alloca ptr, align 8
  %t2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %t, ptr %t2, align 4
  store ptr %val, ptr %val3, align 8
  store ptr %context, ptr %context4, align 8
  %p5 = load ptr, ptr %p1, align 8
  %t6 = load i32, ptr %t2, align 4
  %val7 = load ptr, ptr %val3, align 8
  %calltmp = call i1 @parser_check_val(ptr %p5, i32 %t6, ptr %val7)
  %eqtmp = icmp eq i1 %calltmp, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  call void @print(ptr @.str.66)
  %context8 = load ptr, ptr %context4, align 8
  call void @print(ptr %context8)
  call void @print(ptr @.str.67)
  %val9 = load ptr, ptr %val3, align 8
  call void @print(ptr %val9)
  call void @println(ptr @.str.68)
  call void @exit(i32 1)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %p10 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p10)
  ret void
}

define ptr @parse_declaration(ptr %p) {
entry:
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  %calltmp = call i1 @parser_check_val(ptr %p2, i32 16, ptr @.str.72)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parse_import_statement(ptr %p3)
  ret ptr %calltmp4

ifcont:                                           ; preds = %entry
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call i1 @parser_check_val(ptr %p5, i32 16, ptr @.str.73)
  %ifcond7 = icmp ne i1 %calltmp6, false
  br i1 %ifcond7, label %then8, label %ifcont11

then8:                                            ; preds = %ifcont
  %p9 = load ptr, ptr %p1, align 8
  %calltmp10 = call ptr @parse_variable_decl(ptr %p9)
  ret ptr %calltmp10

ifcont11:                                         ; preds = %ifcont
  %p12 = load ptr, ptr %p1, align 8
  %calltmp13 = call i1 @parser_check_val(ptr %p12, i32 16, ptr @.str.74)
  %ifcond14 = icmp ne i1 %calltmp13, false
  br i1 %ifcond14, label %then15, label %ifcont18

then15:                                           ; preds = %ifcont11
  %p16 = load ptr, ptr %p1, align 8
  %calltmp17 = call ptr @parse_extern_fn_decl(ptr %p16)
  ret ptr %calltmp17

ifcont18:                                         ; preds = %ifcont11
  %p19 = load ptr, ptr %p1, align 8
  %calltmp20 = call i1 @parser_check_val(ptr %p19, i32 16, ptr @.str.75)
  %ifcond21 = icmp ne i1 %calltmp20, false
  br i1 %ifcond21, label %then22, label %ifcont25

then22:                                           ; preds = %ifcont18
  %p23 = load ptr, ptr %p1, align 8
  %calltmp24 = call ptr @parse_function_decl(ptr %p23)
  ret ptr %calltmp24

ifcont25:                                         ; preds = %ifcont18
  %p26 = load ptr, ptr %p1, align 8
  %calltmp27 = call i1 @parser_check_val(ptr %p26, i32 16, ptr @.str.76)
  %ifcond28 = icmp ne i1 %calltmp27, false
  br i1 %ifcond28, label %then29, label %ifcont32

then29:                                           ; preds = %ifcont25
  %p30 = load ptr, ptr %p1, align 8
  %calltmp31 = call ptr @parse_struct_decl(ptr %p30)
  ret ptr %calltmp31

ifcont32:                                         ; preds = %ifcont25
  %p33 = load ptr, ptr %p1, align 8
  %calltmp34 = call i1 @parser_check_val(ptr %p33, i32 16, ptr @.str.77)
  %ifcond35 = icmp ne i1 %calltmp34, false
  br i1 %ifcond35, label %then36, label %ifcont39

then36:                                           ; preds = %ifcont32
  %p37 = load ptr, ptr %p1, align 8
  %calltmp38 = call ptr @parse_enum_decl(ptr %p37)
  ret ptr %calltmp38

ifcont39:                                         ; preds = %ifcont32
  call void @println(ptr @.str.78)
  call void @exit(i32 1)
  %calltmp40 = call ptr @create_node(i32 0)
  ret ptr %calltmp40
}

define ptr @parse_type_annotation(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %type_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %calltmp = call ptr @create_node(i32 30)
  store ptr %calltmp, ptr %type_node, align 8
  %p2 = load ptr, ptr %p1, align 8
  %calltmp3 = call i1 @parser_match_val(ptr %p2, i32 5, ptr @.str.79)
  %ifcond = icmp ne i1 %calltmp3, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structptr = load ptr, ptr %type_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 3
  store i32 1, ptr %fieldptr, align 4
  %p4 = load ptr, ptr %p1, align 8
  %calltmp5 = call ptr @parse_type_annotation(ptr %p4)
  %calltmp6 = call ptr @node_to_ptr(ptr %calltmp5)
  %structptr7 = load ptr, ptr %type_node, align 8
  %fieldptr8 = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 5
  store ptr %calltmp6, ptr %fieldptr8, align 8
  %p9 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p9, i32 5, ptr @.str.80, ptr @.str.81)
  %type_node10 = load ptr, ptr %type_node, align 8
  ret ptr %type_node10

ifcont:                                           ; preds = %entry
  %p11 = load ptr, ptr %p1, align 8
  %calltmp12 = call ptr @parser_current(ptr %p11)
  store ptr %calltmp12, ptr %curr, align 8
  %structptr13 = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr13, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 4
  %structptr14 = load ptr, ptr %curr, align 8
  %type_ptr15 = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 0
  %type16 = load i32, ptr %type_ptr15, align 4
  %eqtmp17 = icmp eq i32 %type16, 16
  %ortmp = or i1 %eqtmp, %eqtmp17
  %ifcond18 = icmp ne i1 %ortmp, false
  br i1 %ifcond18, label %then19, label %else

then19:                                           ; preds = %ifcont
  %structptr20 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr20, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr21 = load ptr, ptr %type_node, align 8
  %fieldptr22 = getelementptr inbounds %ASTNode, ptr %structptr21, i32 0, i32 1
  store ptr %value, ptr %fieldptr22, align 8
  %p23 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p23)
  br label %ifcont24

else:                                             ; preds = %ifcont
  call void @println(ptr @.str.82)
  call void @exit(i32 1)
  br label %ifcont24

ifcont24:                                         ; preds = %else, %then19
  %type_node25 = load ptr, ptr %type_node, align 8
  ret ptr %type_node25
}

define ptr @parse_variable_decl(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %var_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.83, ptr @.str.84)
  %calltmp = call ptr @create_node(i32 3)
  store ptr %calltmp, ptr %var_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call i1 @parser_match_val(ptr %p3, i32 16, ptr @.str.85)
  %ifcond = icmp ne i1 %calltmp4, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structptr = load ptr, ptr %var_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 3
  store i32 1, ptr %fieldptr, align 4
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call ptr @parser_current(ptr %p5)
  store ptr %calltmp6, ptr %curr, align 8
  %structptr7 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr7, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr8 = load ptr, ptr %var_node, align 8
  %fieldptr9 = getelementptr inbounds %ASTNode, ptr %structptr8, i32 0, i32 1
  store ptr %value, ptr %fieldptr9, align 8
  %p10 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p10, i32 4, ptr @.str.86)
  %p11 = load ptr, ptr %p1, align 8
  %calltmp12 = call i1 @parser_match_val(ptr %p11, i32 5, ptr @.str.87)
  %ifcond13 = icmp ne i1 %calltmp12, false
  br i1 %ifcond13, label %then14, label %ifcont20

then14:                                           ; preds = %ifcont
  %p15 = load ptr, ptr %p1, align 8
  %calltmp16 = call ptr @parse_type_annotation(ptr %p15)
  %calltmp17 = call ptr @node_to_ptr(ptr %calltmp16)
  %structptr18 = load ptr, ptr %var_node, align 8
  %fieldptr19 = getelementptr inbounds %ASTNode, ptr %structptr18, i32 0, i32 5
  store ptr %calltmp17, ptr %fieldptr19, align 8
  br label %ifcont20

ifcont20:                                         ; preds = %then14, %ifcont
  %p21 = load ptr, ptr %p1, align 8
  %calltmp22 = call i1 @parser_match_val(ptr %p21, i32 11, ptr @.str.88)
  %ifcond23 = icmp ne i1 %calltmp22, false
  br i1 %ifcond23, label %then24, label %ifcont30

then24:                                           ; preds = %ifcont20
  %p25 = load ptr, ptr %p1, align 8
  %calltmp26 = call ptr @parse_expression(ptr %p25, i32 0)
  %calltmp27 = call ptr @node_to_ptr(ptr %calltmp26)
  %structptr28 = load ptr, ptr %var_node, align 8
  %fieldptr29 = getelementptr inbounds %ASTNode, ptr %structptr28, i32 0, i32 6
  store ptr %calltmp27, ptr %fieldptr29, align 8
  br label %ifcont30

ifcont30:                                         ; preds = %then24, %ifcont20
  %var_node31 = load ptr, ptr %var_node, align 8
  ret ptr %var_node31
}

define ptr @parse_extern_fn_decl(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %curr15 = alloca ptr, align 8
  %param = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %last_param = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %ext_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.89, ptr @.str.90)
  %p3 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p3, i32 16, ptr @.str.91, ptr @.str.92)
  %calltmp = call ptr @create_node(i32 2)
  store ptr %calltmp, ptr %ext_node, align 8
  %p4 = load ptr, ptr %p1, align 8
  %calltmp5 = call ptr @parser_current(ptr %p4)
  store ptr %calltmp5, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr6 = load ptr, ptr %ext_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p7, i32 4, ptr @.str.93)
  %p8 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p8, i32 5, ptr @.str.94, ptr @.str.95)
  store ptr @.str.96, ptr %last_param, align 8
  %p9 = load ptr, ptr %p1, align 8
  %calltmp10 = call i1 @parser_check_val(ptr %p9, i32 5, ptr @.str.97)
  %eqtmp = icmp eq i1 %calltmp10, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont51

then:                                             ; preds = %entry
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont50, %then
  %is_looping11 = load i1, ptr %is_looping, align 1
  br i1 %is_looping11, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp12 = call ptr @create_node(i32 29)
  store ptr %calltmp12, ptr %param, align 8
  %p13 = load ptr, ptr %p1, align 8
  %calltmp14 = call ptr @parser_current(ptr %p13)
  store ptr %calltmp14, ptr %curr15, align 8
  %structptr16 = load ptr, ptr %curr15, align 8
  %value_ptr17 = getelementptr inbounds %Token, ptr %structptr16, i32 0, i32 1
  %value18 = load ptr, ptr %value_ptr17, align 8
  %structptr19 = load ptr, ptr %param, align 8
  %fieldptr20 = getelementptr inbounds %ASTNode, ptr %structptr19, i32 0, i32 1
  store ptr %value18, ptr %fieldptr20, align 8
  %p21 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p21, i32 4, ptr @.str.98)
  %p22 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p22, i32 5, ptr @.str.99, ptr @.str.100)
  %p23 = load ptr, ptr %p1, align 8
  %calltmp24 = call ptr @parse_type_annotation(ptr %p23)
  %calltmp25 = call ptr @node_to_ptr(ptr %calltmp24)
  %structptr26 = load ptr, ptr %param, align 8
  %fieldptr27 = getelementptr inbounds %ASTNode, ptr %structptr26, i32 0, i32 5
  store ptr %calltmp25, ptr %fieldptr27, align 8
  %structptr28 = load ptr, ptr %ext_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr28, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp29 = call i32 @str_equals(ptr %child1, ptr @.str.101)
  %eqtmp30 = icmp eq i32 %calltmp29, 1
  %ifcond31 = icmp ne i1 %eqtmp30, false
  br i1 %ifcond31, label %then32, label %else

then32:                                           ; preds = %whilebody
  %param33 = load ptr, ptr %param, align 8
  %calltmp34 = call ptr @node_to_ptr(ptr %param33)
  %structptr35 = load ptr, ptr %ext_node, align 8
  %fieldptr36 = getelementptr inbounds %ASTNode, ptr %structptr35, i32 0, i32 5
  store ptr %calltmp34, ptr %fieldptr36, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_param37 = load ptr, ptr %last_param, align 8
  %calltmp38 = call ptr @ptr_to_node(ptr %last_param37)
  store ptr %calltmp38, ptr %last, align 8
  %param39 = load ptr, ptr %param, align 8
  %calltmp40 = call ptr @node_to_ptr(ptr %param39)
  %structptr41 = load ptr, ptr %last, align 8
  %fieldptr42 = getelementptr inbounds %ASTNode, ptr %structptr41, i32 0, i32 8
  store ptr %calltmp40, ptr %fieldptr42, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then32
  %param43 = load ptr, ptr %param, align 8
  %calltmp44 = call ptr @node_to_ptr(ptr %param43)
  store ptr %calltmp44, ptr %last_param, align 8
  %p45 = load ptr, ptr %p1, align 8
  %calltmp46 = call i1 @parser_match_val(ptr %p45, i32 5, ptr @.str.102)
  %eqtmp47 = icmp eq i1 %calltmp46, false
  %ifcond48 = icmp ne i1 %eqtmp47, false
  br i1 %ifcond48, label %then49, label %ifcont50

then49:                                           ; preds = %ifcont
  store i1 false, ptr %is_looping, align 1
  br label %ifcont50

ifcont50:                                         ; preds = %then49, %ifcont
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  br label %ifcont51

ifcont51:                                         ; preds = %afterwhile, %entry
  %p52 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p52, i32 5, ptr @.str.103, ptr @.str.104)
  %p53 = load ptr, ptr %p1, align 8
  %calltmp54 = call i1 @parser_match_val(ptr %p53, i32 14, ptr @.str.105)
  %ifcond55 = icmp ne i1 %calltmp54, false
  br i1 %ifcond55, label %then56, label %ifcont62

then56:                                           ; preds = %ifcont51
  %p57 = load ptr, ptr %p1, align 8
  %calltmp58 = call ptr @parse_type_annotation(ptr %p57)
  %calltmp59 = call ptr @node_to_ptr(ptr %calltmp58)
  %structptr60 = load ptr, ptr %ext_node, align 8
  %fieldptr61 = getelementptr inbounds %ASTNode, ptr %structptr60, i32 0, i32 6
  store ptr %calltmp59, ptr %fieldptr61, align 8
  br label %ifcont62

ifcont62:                                         ; preds = %then56, %ifcont51
  %ext_node63 = load ptr, ptr %ext_node, align 8
  ret ptr %ext_node63
}

define ptr @parse_function_decl(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %curr14 = alloca ptr, align 8
  %param = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %last_param = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %fn_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.106, ptr @.str.107)
  %calltmp = call ptr @create_node(i32 4)
  store ptr %calltmp, ptr %fn_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr5 = load ptr, ptr %fn_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %p6 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p6, i32 4, ptr @.str.108)
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.109, ptr @.str.110)
  store ptr @.str.111, ptr %last_param, align 8
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call i1 @parser_check_val(ptr %p8, i32 5, ptr @.str.112)
  %eqtmp = icmp eq i1 %calltmp9, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont50

then:                                             ; preds = %entry
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont49, %then
  %is_looping10 = load i1, ptr %is_looping, align 1
  br i1 %is_looping10, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp11 = call ptr @create_node(i32 29)
  store ptr %calltmp11, ptr %param, align 8
  %p12 = load ptr, ptr %p1, align 8
  %calltmp13 = call ptr @parser_current(ptr %p12)
  store ptr %calltmp13, ptr %curr14, align 8
  %structptr15 = load ptr, ptr %curr14, align 8
  %value_ptr16 = getelementptr inbounds %Token, ptr %structptr15, i32 0, i32 1
  %value17 = load ptr, ptr %value_ptr16, align 8
  %structptr18 = load ptr, ptr %param, align 8
  %fieldptr19 = getelementptr inbounds %ASTNode, ptr %structptr18, i32 0, i32 1
  store ptr %value17, ptr %fieldptr19, align 8
  %p20 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p20, i32 4, ptr @.str.113)
  %p21 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p21, i32 5, ptr @.str.114, ptr @.str.115)
  %p22 = load ptr, ptr %p1, align 8
  %calltmp23 = call ptr @parse_type_annotation(ptr %p22)
  %calltmp24 = call ptr @node_to_ptr(ptr %calltmp23)
  %structptr25 = load ptr, ptr %param, align 8
  %fieldptr26 = getelementptr inbounds %ASTNode, ptr %structptr25, i32 0, i32 5
  store ptr %calltmp24, ptr %fieldptr26, align 8
  %structptr27 = load ptr, ptr %fn_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr27, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp28 = call i32 @str_equals(ptr %child1, ptr @.str.116)
  %eqtmp29 = icmp eq i32 %calltmp28, 1
  %ifcond30 = icmp ne i1 %eqtmp29, false
  br i1 %ifcond30, label %then31, label %else

then31:                                           ; preds = %whilebody
  %param32 = load ptr, ptr %param, align 8
  %calltmp33 = call ptr @node_to_ptr(ptr %param32)
  %structptr34 = load ptr, ptr %fn_node, align 8
  %fieldptr35 = getelementptr inbounds %ASTNode, ptr %structptr34, i32 0, i32 5
  store ptr %calltmp33, ptr %fieldptr35, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_param36 = load ptr, ptr %last_param, align 8
  %calltmp37 = call ptr @ptr_to_node(ptr %last_param36)
  store ptr %calltmp37, ptr %last, align 8
  %param38 = load ptr, ptr %param, align 8
  %calltmp39 = call ptr @node_to_ptr(ptr %param38)
  %structptr40 = load ptr, ptr %last, align 8
  %fieldptr41 = getelementptr inbounds %ASTNode, ptr %structptr40, i32 0, i32 8
  store ptr %calltmp39, ptr %fieldptr41, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then31
  %param42 = load ptr, ptr %param, align 8
  %calltmp43 = call ptr @node_to_ptr(ptr %param42)
  store ptr %calltmp43, ptr %last_param, align 8
  %p44 = load ptr, ptr %p1, align 8
  %calltmp45 = call i1 @parser_match_val(ptr %p44, i32 5, ptr @.str.117)
  %eqtmp46 = icmp eq i1 %calltmp45, false
  %ifcond47 = icmp ne i1 %eqtmp46, false
  br i1 %ifcond47, label %then48, label %ifcont49

then48:                                           ; preds = %ifcont
  store i1 false, ptr %is_looping, align 1
  br label %ifcont49

ifcont49:                                         ; preds = %then48, %ifcont
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  br label %ifcont50

ifcont50:                                         ; preds = %afterwhile, %entry
  %p51 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p51, i32 5, ptr @.str.118, ptr @.str.119)
  %p52 = load ptr, ptr %p1, align 8
  %calltmp53 = call i1 @parser_match_val(ptr %p52, i32 14, ptr @.str.120)
  %ifcond54 = icmp ne i1 %calltmp53, false
  br i1 %ifcond54, label %then55, label %ifcont61

then55:                                           ; preds = %ifcont50
  %p56 = load ptr, ptr %p1, align 8
  %calltmp57 = call ptr @parse_type_annotation(ptr %p56)
  %calltmp58 = call ptr @node_to_ptr(ptr %calltmp57)
  %structptr59 = load ptr, ptr %fn_node, align 8
  %fieldptr60 = getelementptr inbounds %ASTNode, ptr %structptr59, i32 0, i32 7
  store ptr %calltmp58, ptr %fieldptr60, align 8
  br label %ifcont61

ifcont61:                                         ; preds = %then55, %ifcont50
  %p62 = load ptr, ptr %p1, align 8
  %calltmp63 = call ptr @parse_block(ptr %p62)
  %calltmp64 = call ptr @node_to_ptr(ptr %calltmp63)
  %structptr65 = load ptr, ptr %fn_node, align 8
  %fieldptr66 = getelementptr inbounds %ASTNode, ptr %structptr65, i32 0, i32 6
  store ptr %calltmp64, ptr %fieldptr66, align 8
  %fn_node67 = load ptr, ptr %fn_node, align 8
  ret ptr %fn_node67
}

define ptr @parse_struct_decl(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %curr13 = alloca ptr, align 8
  %field = alloca ptr, align 8
  %last_field = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %struct_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.121, ptr @.str.122)
  %calltmp = call ptr @create_node(i32 5)
  store ptr %calltmp, ptr %struct_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr5 = load ptr, ptr %struct_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %p6 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p6, i32 4, ptr @.str.123)
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.124, ptr @.str.125)
  store ptr @.str.126, ptr %last_field, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call i1 @parser_check_val(ptr %p8, i32 5, ptr @.str.127)
  %eqtmp = icmp eq i1 %calltmp9, false
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp10 = call ptr @create_node(i32 31)
  store ptr %calltmp10, ptr %field, align 8
  %p11 = load ptr, ptr %p1, align 8
  %calltmp12 = call ptr @parser_current(ptr %p11)
  store ptr %calltmp12, ptr %curr13, align 8
  %structptr14 = load ptr, ptr %curr13, align 8
  %value_ptr15 = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 1
  %value16 = load ptr, ptr %value_ptr15, align 8
  %structptr17 = load ptr, ptr %field, align 8
  %fieldptr18 = getelementptr inbounds %ASTNode, ptr %structptr17, i32 0, i32 1
  store ptr %value16, ptr %fieldptr18, align 8
  %p19 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p19, i32 4, ptr @.str.128)
  %p20 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p20, i32 5, ptr @.str.129, ptr @.str.130)
  %p21 = load ptr, ptr %p1, align 8
  %calltmp22 = call ptr @parse_type_annotation(ptr %p21)
  %calltmp23 = call ptr @node_to_ptr(ptr %calltmp22)
  %structptr24 = load ptr, ptr %field, align 8
  %fieldptr25 = getelementptr inbounds %ASTNode, ptr %structptr24, i32 0, i32 5
  store ptr %calltmp23, ptr %fieldptr25, align 8
  %structptr26 = load ptr, ptr %struct_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr26, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp27 = call i32 @str_equals(ptr %child1, ptr @.str.131)
  %eqtmp28 = icmp eq i32 %calltmp27, 1
  %ifcond = icmp ne i1 %eqtmp28, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %field29 = load ptr, ptr %field, align 8
  %calltmp30 = call ptr @node_to_ptr(ptr %field29)
  %structptr31 = load ptr, ptr %struct_node, align 8
  %fieldptr32 = getelementptr inbounds %ASTNode, ptr %structptr31, i32 0, i32 5
  store ptr %calltmp30, ptr %fieldptr32, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_field33 = load ptr, ptr %last_field, align 8
  %calltmp34 = call ptr @ptr_to_node(ptr %last_field33)
  store ptr %calltmp34, ptr %last, align 8
  %field35 = load ptr, ptr %field, align 8
  %calltmp36 = call ptr @node_to_ptr(ptr %field35)
  %structptr37 = load ptr, ptr %last, align 8
  %fieldptr38 = getelementptr inbounds %ASTNode, ptr %structptr37, i32 0, i32 8
  store ptr %calltmp36, ptr %fieldptr38, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %field39 = load ptr, ptr %field, align 8
  %calltmp40 = call ptr @node_to_ptr(ptr %field39)
  store ptr %calltmp40, ptr %last_field, align 8
  %p41 = load ptr, ptr %p1, align 8
  %calltmp42 = call i1 @parser_match_val(ptr %p41, i32 5, ptr @.str.132)
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %p43 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p43, i32 5, ptr @.str.133, ptr @.str.134)
  %struct_node44 = load ptr, ptr %struct_node, align 8
  ret ptr %struct_node44
}

define ptr @parse_enum_decl(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %curr13 = alloca ptr, align 8
  %variant = alloca ptr, align 8
  %last_var = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %enum_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.135, ptr @.str.136)
  %calltmp = call ptr @create_node(i32 6)
  store ptr %calltmp, ptr %enum_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr5 = load ptr, ptr %enum_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %p6 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p6, i32 4, ptr @.str.137)
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.138, ptr @.str.139)
  store ptr @.str.140, ptr %last_var, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call i1 @parser_check_val(ptr %p8, i32 5, ptr @.str.141)
  %eqtmp = icmp eq i1 %calltmp9, false
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp10 = call ptr @create_node(i32 32)
  store ptr %calltmp10, ptr %variant, align 8
  %p11 = load ptr, ptr %p1, align 8
  %calltmp12 = call ptr @parser_current(ptr %p11)
  store ptr %calltmp12, ptr %curr13, align 8
  %structptr14 = load ptr, ptr %curr13, align 8
  %value_ptr15 = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 1
  %value16 = load ptr, ptr %value_ptr15, align 8
  %structptr17 = load ptr, ptr %variant, align 8
  %fieldptr18 = getelementptr inbounds %ASTNode, ptr %structptr17, i32 0, i32 1
  store ptr %value16, ptr %fieldptr18, align 8
  %p19 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p19, i32 4, ptr @.str.142)
  %structptr20 = load ptr, ptr %enum_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr20, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp21 = call i32 @str_equals(ptr %child1, ptr @.str.143)
  %eqtmp22 = icmp eq i32 %calltmp21, 1
  %ifcond = icmp ne i1 %eqtmp22, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %variant23 = load ptr, ptr %variant, align 8
  %calltmp24 = call ptr @node_to_ptr(ptr %variant23)
  %structptr25 = load ptr, ptr %enum_node, align 8
  %fieldptr26 = getelementptr inbounds %ASTNode, ptr %structptr25, i32 0, i32 5
  store ptr %calltmp24, ptr %fieldptr26, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_var27 = load ptr, ptr %last_var, align 8
  %calltmp28 = call ptr @ptr_to_node(ptr %last_var27)
  store ptr %calltmp28, ptr %last, align 8
  %variant29 = load ptr, ptr %variant, align 8
  %calltmp30 = call ptr @node_to_ptr(ptr %variant29)
  %structptr31 = load ptr, ptr %last, align 8
  %fieldptr32 = getelementptr inbounds %ASTNode, ptr %structptr31, i32 0, i32 8
  store ptr %calltmp30, ptr %fieldptr32, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %variant33 = load ptr, ptr %variant, align 8
  %calltmp34 = call ptr @node_to_ptr(ptr %variant33)
  store ptr %calltmp34, ptr %last_var, align 8
  %p35 = load ptr, ptr %p1, align 8
  %calltmp36 = call i1 @parser_match_val(ptr %p35, i32 5, ptr @.str.144)
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %p37 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p37, i32 5, ptr @.str.145, ptr @.str.146)
  %enum_node38 = load ptr, ptr %enum_node, align 8
  ret ptr %enum_node38
}

define ptr @parse_block(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %stmt = alloca ptr, align 8
  %last_stmt = alloca ptr, align 8
  %block_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 5, ptr @.str.147, ptr @.str.148)
  %calltmp = call ptr @create_node(i32 9)
  store ptr %calltmp, ptr %block_node, align 8
  store ptr @.str.149, ptr %last_stmt, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call i1 @parser_check_val(ptr %p3, i32 5, ptr @.str.150)
  %eqtmp = icmp eq i1 %calltmp4, false
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call ptr @parse_statement(ptr %p5)
  store ptr %calltmp6, ptr %stmt, align 8
  %structptr = load ptr, ptr %block_node, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp7 = call i32 @str_equals(ptr %child1, ptr @.str.151)
  %eqtmp8 = icmp eq i32 %calltmp7, 1
  %ifcond = icmp ne i1 %eqtmp8, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %stmt9 = load ptr, ptr %stmt, align 8
  %calltmp10 = call ptr @node_to_ptr(ptr %stmt9)
  %structptr11 = load ptr, ptr %block_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 5
  store ptr %calltmp10, ptr %fieldptr, align 8
  br label %ifcont

else:                                             ; preds = %whilebody
  %last_stmt12 = load ptr, ptr %last_stmt, align 8
  %calltmp13 = call ptr @ptr_to_node(ptr %last_stmt12)
  store ptr %calltmp13, ptr %last, align 8
  %stmt14 = load ptr, ptr %stmt, align 8
  %calltmp15 = call ptr @node_to_ptr(ptr %stmt14)
  %structptr16 = load ptr, ptr %last, align 8
  %fieldptr17 = getelementptr inbounds %ASTNode, ptr %structptr16, i32 0, i32 8
  store ptr %calltmp15, ptr %fieldptr17, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %stmt18 = load ptr, ptr %stmt, align 8
  %calltmp19 = call ptr @node_to_ptr(ptr %stmt18)
  store ptr %calltmp19, ptr %last_stmt, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %p20 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p20, i32 5, ptr @.str.152, ptr @.str.153)
  %block_node21 = load ptr, ptr %block_node, align 8
  ret ptr %block_node21
}

define ptr @parse_statement(ptr %p) {
entry:
  %stmt = alloca ptr, align 8
  %assign_stmt = alloca ptr, align 8
  %expr = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %ret_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  %calltmp = call i1 @parser_check_val(ptr %p2, i32 16, ptr @.str.168)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parse_if_statement(ptr %p3)
  ret ptr %calltmp4

ifcont:                                           ; preds = %entry
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call i1 @parser_check_val(ptr %p5, i32 16, ptr @.str.169)
  %ifcond7 = icmp ne i1 %calltmp6, false
  br i1 %ifcond7, label %then8, label %ifcont11

then8:                                            ; preds = %ifcont
  %p9 = load ptr, ptr %p1, align 8
  %calltmp10 = call ptr @parse_while_statement(ptr %p9)
  ret ptr %calltmp10

ifcont11:                                         ; preds = %ifcont
  %p12 = load ptr, ptr %p1, align 8
  %calltmp13 = call i1 @parser_match_val(ptr %p12, i32 16, ptr @.str.170)
  %ifcond14 = icmp ne i1 %calltmp13, false
  br i1 %ifcond14, label %then15, label %ifcont29

then15:                                           ; preds = %ifcont11
  %calltmp16 = call ptr @create_node(i32 15)
  store ptr %calltmp16, ptr %ret_node, align 8
  %p17 = load ptr, ptr %p1, align 8
  %calltmp18 = call ptr @parser_current(ptr %p17)
  store ptr %calltmp18, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %neqtmp = icmp ne i32 %type, 5
  %structptr19 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr19, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %calltmp20 = call i32 @str_equals(ptr %value, ptr @.str.171)
  %eqtmp = icmp eq i32 %calltmp20, 0
  %ortmp = or i1 %neqtmp, %eqtmp
  %ifcond21 = icmp ne i1 %ortmp, false
  br i1 %ifcond21, label %then22, label %ifcont27

then22:                                           ; preds = %then15
  %p23 = load ptr, ptr %p1, align 8
  %calltmp24 = call ptr @parse_expression(ptr %p23, i32 0)
  %calltmp25 = call ptr @node_to_ptr(ptr %calltmp24)
  %structptr26 = load ptr, ptr %ret_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr26, i32 0, i32 5
  store ptr %calltmp25, ptr %fieldptr, align 8
  br label %ifcont27

ifcont27:                                         ; preds = %then22, %then15
  %ret_node28 = load ptr, ptr %ret_node, align 8
  ret ptr %ret_node28

ifcont29:                                         ; preds = %ifcont11
  %p30 = load ptr, ptr %p1, align 8
  %calltmp31 = call i1 @parser_check_val(ptr %p30, i32 16, ptr @.str.172)
  %ifcond32 = icmp ne i1 %calltmp31, false
  br i1 %ifcond32, label %then33, label %ifcont36

then33:                                           ; preds = %ifcont29
  %p34 = load ptr, ptr %p1, align 8
  %calltmp35 = call ptr @parse_variable_decl(ptr %p34)
  ret ptr %calltmp35

ifcont36:                                         ; preds = %ifcont29
  %p37 = load ptr, ptr %p1, align 8
  %calltmp38 = call ptr @parse_expression(ptr %p37, i32 0)
  store ptr %calltmp38, ptr %expr, align 8
  %p39 = load ptr, ptr %p1, align 8
  %calltmp40 = call i1 @parser_match_val(ptr %p39, i32 11, ptr @.str.173)
  %ifcond41 = icmp ne i1 %calltmp40, false
  br i1 %ifcond41, label %then42, label %ifcont54

then42:                                           ; preds = %ifcont36
  %calltmp43 = call ptr @create_node(i32 16)
  store ptr %calltmp43, ptr %assign_stmt, align 8
  %expr44 = load ptr, ptr %expr, align 8
  %calltmp45 = call ptr @node_to_ptr(ptr %expr44)
  %structptr46 = load ptr, ptr %assign_stmt, align 8
  %fieldptr47 = getelementptr inbounds %ASTNode, ptr %structptr46, i32 0, i32 5
  store ptr %calltmp45, ptr %fieldptr47, align 8
  %p48 = load ptr, ptr %p1, align 8
  %calltmp49 = call ptr @parse_expression(ptr %p48, i32 0)
  %calltmp50 = call ptr @node_to_ptr(ptr %calltmp49)
  %structptr51 = load ptr, ptr %assign_stmt, align 8
  %fieldptr52 = getelementptr inbounds %ASTNode, ptr %structptr51, i32 0, i32 6
  store ptr %calltmp50, ptr %fieldptr52, align 8
  %assign_stmt53 = load ptr, ptr %assign_stmt, align 8
  ret ptr %assign_stmt53

ifcont54:                                         ; preds = %ifcont36
  %calltmp55 = call ptr @create_node(i32 17)
  store ptr %calltmp55, ptr %stmt, align 8
  %expr56 = load ptr, ptr %expr, align 8
  %calltmp57 = call ptr @node_to_ptr(ptr %expr56)
  %structptr58 = load ptr, ptr %stmt, align 8
  %fieldptr59 = getelementptr inbounds %ASTNode, ptr %structptr58, i32 0, i32 5
  store ptr %calltmp57, ptr %fieldptr59, align 8
  %stmt60 = load ptr, ptr %stmt, align 8
  ret ptr %stmt60
}

define ptr @parse_expression(ptr %p, i32 %precedence) {
entry:
  %bin_expr = alloca ptr, align 8
  %right = alloca ptr, align 8
  %op = alloca ptr, align 8
  %current_precedence = alloca i32, align 4
  %is_operator = alloca i1, align 1
  %curr = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %left = alloca ptr, align 8
  %precedence2 = alloca i32, align 4
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  store i32 %precedence, ptr %precedence2, align 4
  %p3 = load ptr, ptr %p1, align 8
  %calltmp = call ptr @parse_primary(ptr %p3)
  store ptr %calltmp, ptr %left, align 8
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont52, %entry
  %is_looping4 = load i1, ptr %is_looping, align 1
  br i1 %is_looping4, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call ptr @parser_current(ptr %p5)
  store ptr %calltmp6, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 7
  %structptr7 = load ptr, ptr %curr, align 8
  %type_ptr8 = getelementptr inbounds %Token, ptr %structptr7, i32 0, i32 0
  %type9 = load i32, ptr %type_ptr8, align 4
  %eqtmp10 = icmp eq i32 %type9, 8
  %structptr11 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr11, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %calltmp12 = call i32 @str_equals(ptr %value, ptr @.str.187)
  %eqtmp13 = icmp eq i32 %calltmp12, 1
  %structptr14 = load ptr, ptr %curr, align 8
  %value_ptr15 = getelementptr inbounds %Token, ptr %structptr14, i32 0, i32 1
  %value16 = load ptr, ptr %value_ptr15, align 8
  %calltmp17 = call i32 @str_equals(ptr %value16, ptr @.str.188)
  %eqtmp18 = icmp eq i32 %calltmp17, 1
  %ortmp = or i1 %eqtmp13, %eqtmp18
  %ortmp19 = or i1 %eqtmp10, %ortmp
  %ortmp20 = or i1 %eqtmp, %ortmp19
  store i1 %ortmp20, ptr %is_operator, align 1
  %is_operator21 = load i1, ptr %is_operator, align 1
  %eqtmp22 = icmp eq i1 %is_operator21, false
  %ifcond = icmp ne i1 %eqtmp22, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  store i1 false, ptr %is_looping, align 1
  br label %ifcont52

else:                                             ; preds = %whilebody
  %curr23 = load ptr, ptr %curr, align 8
  %calltmp24 = call i32 @get_operator_precedence(ptr %curr23)
  store i32 %calltmp24, ptr %current_precedence, align 4
  %current_precedence25 = load i32, ptr %current_precedence, align 4
  %eqtmp26 = icmp eq i32 %current_precedence25, 0
  %current_precedence27 = load i32, ptr %current_precedence, align 4
  %precedence28 = load i32, ptr %precedence2, align 4
  %lttmp = icmp slt i32 %current_precedence27, %precedence28
  %ortmp29 = or i1 %eqtmp26, %lttmp
  %ifcond30 = icmp ne i1 %ortmp29, false
  br i1 %ifcond30, label %then31, label %else32

then31:                                           ; preds = %else
  store i1 false, ptr %is_looping, align 1
  br label %ifcont

else32:                                           ; preds = %else
  %structptr33 = load ptr, ptr %curr, align 8
  %value_ptr34 = getelementptr inbounds %Token, ptr %structptr33, i32 0, i32 1
  %value35 = load ptr, ptr %value_ptr34, align 8
  store ptr %value35, ptr %op, align 8
  %p36 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p36)
  %p37 = load ptr, ptr %p1, align 8
  %current_precedence38 = load i32, ptr %current_precedence, align 4
  %addtmp = add i32 %current_precedence38, 1
  %calltmp39 = call ptr @parse_expression(ptr %p37, i32 %addtmp)
  store ptr %calltmp39, ptr %right, align 8
  %calltmp40 = call ptr @create_node(i32 20)
  store ptr %calltmp40, ptr %bin_expr, align 8
  %op41 = load ptr, ptr %op, align 8
  %structptr42 = load ptr, ptr %bin_expr, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr42, i32 0, i32 1
  store ptr %op41, ptr %fieldptr, align 8
  %left43 = load ptr, ptr %left, align 8
  %calltmp44 = call ptr @node_to_ptr(ptr %left43)
  %structptr45 = load ptr, ptr %bin_expr, align 8
  %fieldptr46 = getelementptr inbounds %ASTNode, ptr %structptr45, i32 0, i32 5
  store ptr %calltmp44, ptr %fieldptr46, align 8
  %right47 = load ptr, ptr %right, align 8
  %calltmp48 = call ptr @node_to_ptr(ptr %right47)
  %structptr49 = load ptr, ptr %bin_expr, align 8
  %fieldptr50 = getelementptr inbounds %ASTNode, ptr %structptr49, i32 0, i32 6
  store ptr %calltmp48, ptr %fieldptr50, align 8
  %bin_expr51 = load ptr, ptr %bin_expr, align 8
  store ptr %bin_expr51, ptr %left, align 8
  br label %ifcont

ifcont:                                           ; preds = %else32, %then31
  br label %ifcont52

ifcont52:                                         ; preds = %ifcont, %then
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %left53 = load ptr, ptr %left, align 8
  ret ptr %left53
}

define ptr @parse_primary(ptr %p) {
entry:
  %last244 = alloca ptr, align 8
  %elem = alloca ptr, align 8
  %is_looping224 = alloca i1, align 1
  %last_elem = alloca ptr, align 8
  %array_lit = alloca ptr, align 8
  %expr_inner = alloca ptr, align 8
  %curr_mem = alloca ptr, align 8
  %member_node = alloca ptr, align 8
  %index_node = alloca ptr, align 8
  %last144 = alloca ptr, align 8
  %arg = alloca ptr, align 8
  %is_arg_looping = alloca i1, align 1
  %last_arg = alloca ptr, align 8
  %call = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %expr = alloca ptr, align 8
  %ident = alloca ptr, align 8
  %last = alloca ptr, align 8
  %field_tok = alloca ptr, align 8
  %field = alloca ptr, align 8
  %last_field = alloca ptr, align 8
  %struct_lit = alloca ptr, align 8
  %next_tok = alloca ptr, align 8
  %lit = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  %calltmp = call ptr @parser_current(ptr %p2)
  store ptr %calltmp, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 2
  %structptr3 = load ptr, ptr %curr, align 8
  %type_ptr4 = getelementptr inbounds %Token, ptr %structptr3, i32 0, i32 0
  %type5 = load i32, ptr %type_ptr4, align 4
  %eqtmp6 = icmp eq i32 %type5, 0
  %structptr7 = load ptr, ptr %curr, align 8
  %type_ptr8 = getelementptr inbounds %Token, ptr %structptr7, i32 0, i32 0
  %type9 = load i32, ptr %type_ptr8, align 4
  %eqtmp10 = icmp eq i32 %type9, 3
  %structptr11 = load ptr, ptr %curr, align 8
  %type_ptr12 = getelementptr inbounds %Token, ptr %structptr11, i32 0, i32 0
  %type13 = load i32, ptr %type_ptr12, align 4
  %eqtmp14 = icmp eq i32 %type13, 1
  %ortmp = or i1 %eqtmp10, %eqtmp14
  %ortmp15 = or i1 %eqtmp6, %ortmp
  %ortmp16 = or i1 %eqtmp, %ortmp15
  %ifcond = icmp ne i1 %ortmp16, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %calltmp17 = call ptr @create_node(i32 22)
  store ptr %calltmp17, ptr %lit, align 8
  %structptr18 = load ptr, ptr %curr, align 8
  %type_ptr19 = getelementptr inbounds %Token, ptr %structptr18, i32 0, i32 0
  %type20 = load i32, ptr %type_ptr19, align 4
  %structptr21 = load ptr, ptr %lit, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr21, i32 0, i32 3
  store i32 %type20, ptr %fieldptr, align 4
  %structptr22 = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr22, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr23 = load ptr, ptr %lit, align 8
  %fieldptr24 = getelementptr inbounds %ASTNode, ptr %structptr23, i32 0, i32 1
  store ptr %value, ptr %fieldptr24, align 8
  %p25 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p25)
  %lit26 = load ptr, ptr %lit, align 8
  ret ptr %lit26

ifcont:                                           ; preds = %entry
  %structptr27 = load ptr, ptr %curr, align 8
  %type_ptr28 = getelementptr inbounds %Token, ptr %structptr27, i32 0, i32 0
  %type29 = load i32, ptr %type_ptr28, align 4
  %eqtmp30 = icmp eq i32 %type29, 4
  %ifcond31 = icmp ne i1 %eqtmp30, false
  br i1 %ifcond31, label %then32, label %ifcont95

then32:                                           ; preds = %ifcont
  %p33 = load ptr, ptr %p1, align 8
  %calltmp34 = call ptr @parser_peek(ptr %p33)
  store ptr %calltmp34, ptr %next_tok, align 8
  %structptr35 = load ptr, ptr %next_tok, align 8
  %type_ptr36 = getelementptr inbounds %Token, ptr %structptr35, i32 0, i32 0
  %type37 = load i32, ptr %type_ptr36, align 4
  %eqtmp38 = icmp eq i32 %type37, 5
  %structptr39 = load ptr, ptr %next_tok, align 8
  %value_ptr40 = getelementptr inbounds %Token, ptr %structptr39, i32 0, i32 1
  %value41 = load ptr, ptr %value_ptr40, align 8
  %calltmp42 = call i32 @str_equals(ptr %value41, ptr @.str.189)
  %eqtmp43 = icmp eq i32 %calltmp42, 1
  %andtmp = and i1 %eqtmp38, %eqtmp43
  %ifcond44 = icmp ne i1 %andtmp, false
  br i1 %ifcond44, label %then45, label %ifcont94

then45:                                           ; preds = %then32
  %calltmp46 = call ptr @create_node(i32 28)
  store ptr %calltmp46, ptr %struct_lit, align 8
  %structptr47 = load ptr, ptr %curr, align 8
  %value_ptr48 = getelementptr inbounds %Token, ptr %structptr47, i32 0, i32 1
  %value49 = load ptr, ptr %value_ptr48, align 8
  %structptr50 = load ptr, ptr %struct_lit, align 8
  %fieldptr51 = getelementptr inbounds %ASTNode, ptr %structptr50, i32 0, i32 1
  store ptr %value49, ptr %fieldptr51, align 8
  %p52 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p52)
  %p53 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p53, i32 5, ptr @.str.190, ptr @.str.191)
  store ptr @.str.192, ptr %last_field, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont87, %then45
  %p54 = load ptr, ptr %p1, align 8
  %calltmp55 = call i1 @parser_check_val(ptr %p54, i32 5, ptr @.str.193)
  %eqtmp56 = icmp eq i1 %calltmp55, false
  br i1 %eqtmp56, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %calltmp57 = call ptr @create_node(i32 31)
  store ptr %calltmp57, ptr %field, align 8
  %p58 = load ptr, ptr %p1, align 8
  %calltmp59 = call ptr @parser_current(ptr %p58)
  store ptr %calltmp59, ptr %field_tok, align 8
  %structptr60 = load ptr, ptr %field_tok, align 8
  %value_ptr61 = getelementptr inbounds %Token, ptr %structptr60, i32 0, i32 1
  %value62 = load ptr, ptr %value_ptr61, align 8
  %structptr63 = load ptr, ptr %field, align 8
  %fieldptr64 = getelementptr inbounds %ASTNode, ptr %structptr63, i32 0, i32 1
  store ptr %value62, ptr %fieldptr64, align 8
  %p65 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p65, i32 4, ptr @.str.194)
  %p66 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p66, i32 5, ptr @.str.195, ptr @.str.196)
  %p67 = load ptr, ptr %p1, align 8
  %calltmp68 = call ptr @parse_expression(ptr %p67, i32 0)
  %calltmp69 = call ptr @node_to_ptr(ptr %calltmp68)
  %structptr70 = load ptr, ptr %field, align 8
  %fieldptr71 = getelementptr inbounds %ASTNode, ptr %structptr70, i32 0, i32 5
  store ptr %calltmp69, ptr %fieldptr71, align 8
  %structptr72 = load ptr, ptr %struct_lit, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr72, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp73 = call i32 @str_equals(ptr %child1, ptr @.str.197)
  %eqtmp74 = icmp eq i32 %calltmp73, 1
  %ifcond75 = icmp ne i1 %eqtmp74, false
  br i1 %ifcond75, label %then76, label %else

then76:                                           ; preds = %whilebody
  %field77 = load ptr, ptr %field, align 8
  %calltmp78 = call ptr @node_to_ptr(ptr %field77)
  %structptr79 = load ptr, ptr %struct_lit, align 8
  %fieldptr80 = getelementptr inbounds %ASTNode, ptr %structptr79, i32 0, i32 5
  store ptr %calltmp78, ptr %fieldptr80, align 8
  br label %ifcont87

else:                                             ; preds = %whilebody
  %last_field81 = load ptr, ptr %last_field, align 8
  %calltmp82 = call ptr @ptr_to_node(ptr %last_field81)
  store ptr %calltmp82, ptr %last, align 8
  %field83 = load ptr, ptr %field, align 8
  %calltmp84 = call ptr @node_to_ptr(ptr %field83)
  %structptr85 = load ptr, ptr %last, align 8
  %fieldptr86 = getelementptr inbounds %ASTNode, ptr %structptr85, i32 0, i32 8
  store ptr %calltmp84, ptr %fieldptr86, align 8
  br label %ifcont87

ifcont87:                                         ; preds = %else, %then76
  %field88 = load ptr, ptr %field, align 8
  %calltmp89 = call ptr @node_to_ptr(ptr %field88)
  store ptr %calltmp89, ptr %last_field, align 8
  %p90 = load ptr, ptr %p1, align 8
  %calltmp91 = call i1 @parser_match_val(ptr %p90, i32 5, ptr @.str.198)
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %p92 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p92, i32 5, ptr @.str.199, ptr @.str.200)
  %struct_lit93 = load ptr, ptr %struct_lit, align 8
  ret ptr %struct_lit93

ifcont94:                                         ; preds = %then32
  br label %ifcont95

ifcont95:                                         ; preds = %ifcont94, %ifcont
  %structptr96 = load ptr, ptr %curr, align 8
  %type_ptr97 = getelementptr inbounds %Token, ptr %structptr96, i32 0, i32 0
  %type98 = load i32, ptr %type_ptr97, align 4
  %eqtmp99 = icmp eq i32 %type98, 4
  %ifcond100 = icmp ne i1 %eqtmp99, false
  br i1 %ifcond100, label %then101, label %ifcont204

then101:                                          ; preds = %ifcont95
  %calltmp102 = call ptr @create_node(i32 23)
  store ptr %calltmp102, ptr %ident, align 8
  %structptr103 = load ptr, ptr %curr, align 8
  %value_ptr104 = getelementptr inbounds %Token, ptr %structptr103, i32 0, i32 1
  %value105 = load ptr, ptr %value_ptr104, align 8
  %structptr106 = load ptr, ptr %ident, align 8
  %fieldptr107 = getelementptr inbounds %ASTNode, ptr %structptr106, i32 0, i32 1
  store ptr %value105, ptr %fieldptr107, align 8
  %p108 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p108)
  %ident109 = load ptr, ptr %ident, align 8
  store ptr %ident109, ptr %expr, align 8
  store i1 true, ptr %is_looping, align 1
  br label %whilecond110

whilecond110:                                     ; preds = %ifcont201, %then101
  %is_looping111 = load i1, ptr %is_looping, align 1
  br i1 %is_looping111, label %whilebody112, label %afterwhile202

whilebody112:                                     ; preds = %whilecond110
  %p113 = load ptr, ptr %p1, align 8
  %calltmp114 = call i1 @parser_match_val(ptr %p113, i32 5, ptr @.str.201)
  %ifcond115 = icmp ne i1 %calltmp114, false
  br i1 %ifcond115, label %then116, label %else162

then116:                                          ; preds = %whilebody112
  %calltmp117 = call ptr @create_node(i32 24)
  store ptr %calltmp117, ptr %call, align 8
  %expr118 = load ptr, ptr %expr, align 8
  %calltmp119 = call ptr @node_to_ptr(ptr %expr118)
  %structptr120 = load ptr, ptr %call, align 8
  %fieldptr121 = getelementptr inbounds %ASTNode, ptr %structptr120, i32 0, i32 5
  store ptr %calltmp119, ptr %fieldptr121, align 8
  store ptr @.str.202, ptr %last_arg, align 8
  %p122 = load ptr, ptr %p1, align 8
  %calltmp123 = call i1 @parser_check_val(ptr %p122, i32 5, ptr @.str.203)
  %eqtmp124 = icmp eq i1 %calltmp123, false
  %ifcond125 = icmp ne i1 %eqtmp124, false
  br i1 %ifcond125, label %then126, label %ifcont159

then126:                                          ; preds = %then116
  store i1 true, ptr %is_arg_looping, align 1
  br label %whilecond127

whilecond127:                                     ; preds = %ifcont157, %then126
  %is_arg_looping128 = load i1, ptr %is_arg_looping, align 1
  br i1 %is_arg_looping128, label %whilebody129, label %afterwhile158

whilebody129:                                     ; preds = %whilecond127
  %p130 = load ptr, ptr %p1, align 8
  %calltmp131 = call ptr @parse_expression(ptr %p130, i32 0)
  store ptr %calltmp131, ptr %arg, align 8
  %structptr132 = load ptr, ptr %call, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr132, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp133 = call i32 @str_equals(ptr %child2, ptr @.str.204)
  %eqtmp134 = icmp eq i32 %calltmp133, 1
  %ifcond135 = icmp ne i1 %eqtmp134, false
  br i1 %ifcond135, label %then136, label %else141

then136:                                          ; preds = %whilebody129
  %arg137 = load ptr, ptr %arg, align 8
  %calltmp138 = call ptr @node_to_ptr(ptr %arg137)
  %structptr139 = load ptr, ptr %call, align 8
  %fieldptr140 = getelementptr inbounds %ASTNode, ptr %structptr139, i32 0, i32 6
  store ptr %calltmp138, ptr %fieldptr140, align 8
  br label %ifcont149

else141:                                          ; preds = %whilebody129
  %last_arg142 = load ptr, ptr %last_arg, align 8
  %calltmp143 = call ptr @ptr_to_node(ptr %last_arg142)
  store ptr %calltmp143, ptr %last144, align 8
  %arg145 = load ptr, ptr %arg, align 8
  %calltmp146 = call ptr @node_to_ptr(ptr %arg145)
  %structptr147 = load ptr, ptr %last144, align 8
  %fieldptr148 = getelementptr inbounds %ASTNode, ptr %structptr147, i32 0, i32 8
  store ptr %calltmp146, ptr %fieldptr148, align 8
  br label %ifcont149

ifcont149:                                        ; preds = %else141, %then136
  %arg150 = load ptr, ptr %arg, align 8
  %calltmp151 = call ptr @node_to_ptr(ptr %arg150)
  store ptr %calltmp151, ptr %last_arg, align 8
  %p152 = load ptr, ptr %p1, align 8
  %calltmp153 = call i1 @parser_match_val(ptr %p152, i32 5, ptr @.str.205)
  %eqtmp154 = icmp eq i1 %calltmp153, false
  %ifcond155 = icmp ne i1 %eqtmp154, false
  br i1 %ifcond155, label %then156, label %ifcont157

then156:                                          ; preds = %ifcont149
  store i1 false, ptr %is_arg_looping, align 1
  br label %ifcont157

ifcont157:                                        ; preds = %then156, %ifcont149
  br label %whilecond127

afterwhile158:                                    ; preds = %whilecond127
  br label %ifcont159

ifcont159:                                        ; preds = %afterwhile158, %then116
  %p160 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p160, i32 5, ptr @.str.206, ptr @.str.207)
  %call161 = load ptr, ptr %call, align 8
  store ptr %call161, ptr %expr, align 8
  br label %ifcont201

else162:                                          ; preds = %whilebody112
  %p163 = load ptr, ptr %p1, align 8
  %calltmp164 = call i1 @parser_match_val(ptr %p163, i32 5, ptr @.str.208)
  %ifcond165 = icmp ne i1 %calltmp164, false
  br i1 %ifcond165, label %then166, label %else179

then166:                                          ; preds = %else162
  %calltmp167 = call ptr @create_node(i32 26)
  store ptr %calltmp167, ptr %index_node, align 8
  %expr168 = load ptr, ptr %expr, align 8
  %calltmp169 = call ptr @node_to_ptr(ptr %expr168)
  %structptr170 = load ptr, ptr %index_node, align 8
  %fieldptr171 = getelementptr inbounds %ASTNode, ptr %structptr170, i32 0, i32 5
  store ptr %calltmp169, ptr %fieldptr171, align 8
  %p172 = load ptr, ptr %p1, align 8
  %calltmp173 = call ptr @parse_expression(ptr %p172, i32 0)
  %calltmp174 = call ptr @node_to_ptr(ptr %calltmp173)
  %structptr175 = load ptr, ptr %index_node, align 8
  %fieldptr176 = getelementptr inbounds %ASTNode, ptr %structptr175, i32 0, i32 6
  store ptr %calltmp174, ptr %fieldptr176, align 8
  %p177 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p177, i32 5, ptr @.str.209, ptr @.str.210)
  %index_node178 = load ptr, ptr %index_node, align 8
  store ptr %index_node178, ptr %expr, align 8
  br label %ifcont200

else179:                                          ; preds = %else162
  %p180 = load ptr, ptr %p1, align 8
  %calltmp181 = call i1 @parser_match_val(ptr %p180, i32 5, ptr @.str.211)
  %ifcond182 = icmp ne i1 %calltmp181, false
  br i1 %ifcond182, label %then183, label %else198

then183:                                          ; preds = %else179
  %calltmp184 = call ptr @create_node(i32 25)
  store ptr %calltmp184, ptr %member_node, align 8
  %expr185 = load ptr, ptr %expr, align 8
  %calltmp186 = call ptr @node_to_ptr(ptr %expr185)
  %structptr187 = load ptr, ptr %member_node, align 8
  %fieldptr188 = getelementptr inbounds %ASTNode, ptr %structptr187, i32 0, i32 5
  store ptr %calltmp186, ptr %fieldptr188, align 8
  %p189 = load ptr, ptr %p1, align 8
  %calltmp190 = call ptr @parser_current(ptr %p189)
  store ptr %calltmp190, ptr %curr_mem, align 8
  %structptr191 = load ptr, ptr %curr_mem, align 8
  %value_ptr192 = getelementptr inbounds %Token, ptr %structptr191, i32 0, i32 1
  %value193 = load ptr, ptr %value_ptr192, align 8
  %structptr194 = load ptr, ptr %member_node, align 8
  %fieldptr195 = getelementptr inbounds %ASTNode, ptr %structptr194, i32 0, i32 1
  store ptr %value193, ptr %fieldptr195, align 8
  %p196 = load ptr, ptr %p1, align 8
  call void @parser_expect(ptr %p196, i32 4, ptr @.str.212)
  %member_node197 = load ptr, ptr %member_node, align 8
  store ptr %member_node197, ptr %expr, align 8
  br label %ifcont199

else198:                                          ; preds = %else179
  store i1 false, ptr %is_looping, align 1
  br label %ifcont199

ifcont199:                                        ; preds = %else198, %then183
  br label %ifcont200

ifcont200:                                        ; preds = %ifcont199, %then166
  br label %ifcont201

ifcont201:                                        ; preds = %ifcont200, %ifcont159
  br label %whilecond110

afterwhile202:                                    ; preds = %whilecond110
  %expr203 = load ptr, ptr %expr, align 8
  ret ptr %expr203

ifcont204:                                        ; preds = %ifcont95
  %p205 = load ptr, ptr %p1, align 8
  %calltmp206 = call i1 @parser_match_val(ptr %p205, i32 5, ptr @.str.213)
  %ifcond207 = icmp ne i1 %calltmp206, false
  br i1 %ifcond207, label %then208, label %ifcont213

then208:                                          ; preds = %ifcont204
  %p209 = load ptr, ptr %p1, align 8
  %calltmp210 = call ptr @parse_expression(ptr %p209, i32 0)
  store ptr %calltmp210, ptr %expr_inner, align 8
  %p211 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p211, i32 5, ptr @.str.214, ptr @.str.215)
  %expr_inner212 = load ptr, ptr %expr_inner, align 8
  ret ptr %expr_inner212

ifcont213:                                        ; preds = %ifcont204
  %p214 = load ptr, ptr %p1, align 8
  %calltmp215 = call i1 @parser_match_val(ptr %p214, i32 5, ptr @.str.216)
  %ifcond216 = icmp ne i1 %calltmp215, false
  br i1 %ifcond216, label %then217, label %ifcont262

then217:                                          ; preds = %ifcont213
  %calltmp218 = call ptr @create_node(i32 27)
  store ptr %calltmp218, ptr %array_lit, align 8
  store ptr @.str.217, ptr %last_elem, align 8
  %p219 = load ptr, ptr %p1, align 8
  %calltmp220 = call i1 @parser_check_val(ptr %p219, i32 5, ptr @.str.218)
  %eqtmp221 = icmp eq i1 %calltmp220, false
  %ifcond222 = icmp ne i1 %eqtmp221, false
  br i1 %ifcond222, label %then223, label %ifcont259

then223:                                          ; preds = %then217
  store i1 true, ptr %is_looping224, align 1
  br label %whilecond225

whilecond225:                                     ; preds = %ifcont257, %then223
  %is_looping226 = load i1, ptr %is_looping224, align 1
  br i1 %is_looping226, label %whilebody227, label %afterwhile258

whilebody227:                                     ; preds = %whilecond225
  %p228 = load ptr, ptr %p1, align 8
  %calltmp229 = call ptr @parse_expression(ptr %p228, i32 0)
  store ptr %calltmp229, ptr %elem, align 8
  %structptr230 = load ptr, ptr %array_lit, align 8
  %child1_ptr231 = getelementptr inbounds %ASTNode, ptr %structptr230, i32 0, i32 5
  %child1232 = load ptr, ptr %child1_ptr231, align 8
  %calltmp233 = call i32 @str_equals(ptr %child1232, ptr @.str.219)
  %eqtmp234 = icmp eq i32 %calltmp233, 1
  %ifcond235 = icmp ne i1 %eqtmp234, false
  br i1 %ifcond235, label %then236, label %else241

then236:                                          ; preds = %whilebody227
  %elem237 = load ptr, ptr %elem, align 8
  %calltmp238 = call ptr @node_to_ptr(ptr %elem237)
  %structptr239 = load ptr, ptr %array_lit, align 8
  %fieldptr240 = getelementptr inbounds %ASTNode, ptr %structptr239, i32 0, i32 5
  store ptr %calltmp238, ptr %fieldptr240, align 8
  br label %ifcont249

else241:                                          ; preds = %whilebody227
  %last_elem242 = load ptr, ptr %last_elem, align 8
  %calltmp243 = call ptr @ptr_to_node(ptr %last_elem242)
  store ptr %calltmp243, ptr %last244, align 8
  %elem245 = load ptr, ptr %elem, align 8
  %calltmp246 = call ptr @node_to_ptr(ptr %elem245)
  %structptr247 = load ptr, ptr %last244, align 8
  %fieldptr248 = getelementptr inbounds %ASTNode, ptr %structptr247, i32 0, i32 8
  store ptr %calltmp246, ptr %fieldptr248, align 8
  br label %ifcont249

ifcont249:                                        ; preds = %else241, %then236
  %elem250 = load ptr, ptr %elem, align 8
  %calltmp251 = call ptr @node_to_ptr(ptr %elem250)
  store ptr %calltmp251, ptr %last_elem, align 8
  %p252 = load ptr, ptr %p1, align 8
  %calltmp253 = call i1 @parser_match_val(ptr %p252, i32 5, ptr @.str.220)
  %eqtmp254 = icmp eq i1 %calltmp253, false
  %ifcond255 = icmp ne i1 %eqtmp254, false
  br i1 %ifcond255, label %then256, label %ifcont257

then256:                                          ; preds = %ifcont249
  store i1 false, ptr %is_looping224, align 1
  br label %ifcont257

ifcont257:                                        ; preds = %then256, %ifcont249
  br label %whilecond225

afterwhile258:                                    ; preds = %whilecond225
  br label %ifcont259

ifcont259:                                        ; preds = %afterwhile258, %then217
  %p260 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p260, i32 5, ptr @.str.221, ptr @.str.222)
  %array_lit261 = load ptr, ptr %array_lit, align 8
  ret ptr %array_lit261

ifcont262:                                        ; preds = %ifcont213
  call void @print(ptr @.str.223)
  %structptr263 = load ptr, ptr %curr, align 8
  %type_ptr264 = getelementptr inbounds %Token, ptr %structptr263, i32 0, i32 0
  %type265 = load i32, ptr %type_ptr264, align 4
  %calltmp266 = call ptr @type_to_string(i32 %type265)
  call void @print(ptr %calltmp266)
  call void @print(ptr @.str.224)
  %structptr267 = load ptr, ptr %curr, align 8
  %value_ptr268 = getelementptr inbounds %Token, ptr %structptr267, i32 0, i32 1
  %value269 = load ptr, ptr %value_ptr268, align 8
  call void @print(ptr %value269)
  call void @println(ptr @.str.225)
  call void @exit(i32 1)
  %calltmp270 = call ptr @create_node(i32 0)
  ret ptr %calltmp270
}

define ptr @parse_module(ptr %p) {
entry:
  %last = alloca ptr, align 8
  %stmt = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %is_looping = alloca i1, align 1
  %last_stmt = alloca ptr, align 8
  %module = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %calltmp = call ptr @create_node(i32 0)
  store ptr %calltmp, ptr %module, align 8
  store ptr @.str.226, ptr %last_stmt, align 8
  store i1 true, ptr %is_looping, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont24, %entry
  %is_looping2 = load i1, ptr %is_looping, align 1
  br i1 %is_looping2, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 18
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  store i1 false, ptr %is_looping, align 1
  br label %ifcont24

else:                                             ; preds = %whilebody
  %p5 = load ptr, ptr %p1, align 8
  %calltmp6 = call ptr @parse_declaration(ptr %p5)
  store ptr %calltmp6, ptr %stmt, align 8
  %structptr7 = load ptr, ptr %module, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp8 = call i32 @str_equals(ptr %child1, ptr @.str.227)
  %eqtmp9 = icmp eq i32 %calltmp8, 1
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %else15

then11:                                           ; preds = %else
  %stmt12 = load ptr, ptr %stmt, align 8
  %calltmp13 = call ptr @node_to_ptr(ptr %stmt12)
  %structptr14 = load ptr, ptr %module, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr14, i32 0, i32 5
  store ptr %calltmp13, ptr %fieldptr, align 8
  br label %ifcont

else15:                                           ; preds = %else
  %last_stmt16 = load ptr, ptr %last_stmt, align 8
  %calltmp17 = call ptr @ptr_to_node(ptr %last_stmt16)
  store ptr %calltmp17, ptr %last, align 8
  %stmt18 = load ptr, ptr %stmt, align 8
  %calltmp19 = call ptr @node_to_ptr(ptr %stmt18)
  %structptr20 = load ptr, ptr %last, align 8
  %fieldptr21 = getelementptr inbounds %ASTNode, ptr %structptr20, i32 0, i32 8
  store ptr %calltmp19, ptr %fieldptr21, align 8
  br label %ifcont

ifcont:                                           ; preds = %else15, %then11
  %stmt22 = load ptr, ptr %stmt, align 8
  %calltmp23 = call ptr @node_to_ptr(ptr %stmt22)
  store ptr %calltmp23, ptr %last_stmt, align 8
  br label %ifcont24

ifcont24:                                         ; preds = %ifcont, %then
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %module25 = load ptr, ptr %module, align 8
  ret ptr %module25
}

define ptr @parse_import_statement(ptr %p) {
entry:
  %curr = alloca ptr, align 8
  %import_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.69, ptr @.str.70)
  %calltmp = call ptr @create_node(i32 1)
  store ptr %calltmp, ptr %import_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  %calltmp4 = call ptr @parser_current(ptr %p3)
  store ptr %calltmp4, ptr %curr, align 8
  %structptr = load ptr, ptr %curr, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %structptr5 = load ptr, ptr %import_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  store ptr %value, ptr %fieldptr, align 8
  %structptr6 = load ptr, ptr %curr, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr6, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp = icmp eq i32 %type, 4
  %structptr7 = load ptr, ptr %curr, align 8
  %type_ptr8 = getelementptr inbounds %Token, ptr %structptr7, i32 0, i32 0
  %type9 = load i32, ptr %type_ptr8, align 4
  %eqtmp10 = icmp eq i32 %type9, 16
  %ortmp = or i1 %eqtmp, %eqtmp10
  %ifcond = icmp ne i1 %ortmp, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %entry
  %p11 = load ptr, ptr %p1, align 8
  call void @parser_advance(ptr %p11)
  br label %ifcont

else:                                             ; preds = %entry
  call void @println(ptr @.str.71)
  call void @exit(i32 1)
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %import_node12 = load ptr, ptr %import_node, align 8
  ret ptr %import_node12
}

define ptr @parse_if_statement(ptr %p) {
entry:
  %if_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.154, ptr @.str.155)
  %calltmp = call ptr @create_node(i32 10)
  store ptr %calltmp, ptr %if_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p3, i32 5, ptr @.str.156, ptr @.str.157)
  %p4 = load ptr, ptr %p1, align 8
  %calltmp5 = call ptr @parse_expression(ptr %p4, i32 0)
  %calltmp6 = call ptr @node_to_ptr(ptr %calltmp5)
  %structptr = load ptr, ptr %if_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  store ptr %calltmp6, ptr %fieldptr, align 8
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.158, ptr @.str.159)
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call ptr @parse_block(ptr %p8)
  %calltmp10 = call ptr @node_to_ptr(ptr %calltmp9)
  %structptr11 = load ptr, ptr %if_node, align 8
  %fieldptr12 = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 6
  store ptr %calltmp10, ptr %fieldptr12, align 8
  %p13 = load ptr, ptr %p1, align 8
  %calltmp14 = call i1 @parser_match_val(ptr %p13, i32 16, ptr @.str.160)
  %ifcond = icmp ne i1 %calltmp14, false
  br i1 %ifcond, label %then, label %ifcont29

then:                                             ; preds = %entry
  %p15 = load ptr, ptr %p1, align 8
  %calltmp16 = call i1 @parser_check_val(ptr %p15, i32 16, ptr @.str.161)
  %ifcond17 = icmp ne i1 %calltmp16, false
  br i1 %ifcond17, label %then18, label %else

then18:                                           ; preds = %then
  %p19 = load ptr, ptr %p1, align 8
  %calltmp20 = call ptr @parse_if_statement(ptr %p19)
  %calltmp21 = call ptr @node_to_ptr(ptr %calltmp20)
  %structptr22 = load ptr, ptr %if_node, align 8
  %fieldptr23 = getelementptr inbounds %ASTNode, ptr %structptr22, i32 0, i32 7
  store ptr %calltmp21, ptr %fieldptr23, align 8
  br label %ifcont

else:                                             ; preds = %then
  %p24 = load ptr, ptr %p1, align 8
  %calltmp25 = call ptr @parse_block(ptr %p24)
  %calltmp26 = call ptr @node_to_ptr(ptr %calltmp25)
  %structptr27 = load ptr, ptr %if_node, align 8
  %fieldptr28 = getelementptr inbounds %ASTNode, ptr %structptr27, i32 0, i32 7
  store ptr %calltmp26, ptr %fieldptr28, align 8
  br label %ifcont

ifcont:                                           ; preds = %else, %then18
  br label %ifcont29

ifcont29:                                         ; preds = %ifcont, %entry
  %if_node30 = load ptr, ptr %if_node, align 8
  ret ptr %if_node30
}

define ptr @parse_while_statement(ptr %p) {
entry:
  %while_node = alloca ptr, align 8
  %p1 = alloca ptr, align 8
  store ptr %p, ptr %p1, align 8
  %p2 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p2, i32 16, ptr @.str.162, ptr @.str.163)
  %calltmp = call ptr @create_node(i32 13)
  store ptr %calltmp, ptr %while_node, align 8
  %p3 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p3, i32 5, ptr @.str.164, ptr @.str.165)
  %p4 = load ptr, ptr %p1, align 8
  %calltmp5 = call ptr @parse_expression(ptr %p4, i32 0)
  %calltmp6 = call ptr @node_to_ptr(ptr %calltmp5)
  %structptr = load ptr, ptr %while_node, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  store ptr %calltmp6, ptr %fieldptr, align 8
  %p7 = load ptr, ptr %p1, align 8
  call void @parser_expect_val(ptr %p7, i32 5, ptr @.str.166, ptr @.str.167)
  %p8 = load ptr, ptr %p1, align 8
  %calltmp9 = call ptr @parse_block(ptr %p8)
  %calltmp10 = call ptr @node_to_ptr(ptr %calltmp9)
  %structptr11 = load ptr, ptr %while_node, align 8
  %fieldptr12 = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 6
  store ptr %calltmp10, ptr %fieldptr12, align 8
  %while_node13 = load ptr, ptr %while_node, align 8
  ret ptr %while_node13
}

define i32 @get_operator_precedence(ptr %t) {
entry:
  %t1 = alloca ptr, align 8
  store ptr %t, ptr %t1, align 8
  %structptr = load ptr, ptr %t1, align 8
  %value_ptr = getelementptr inbounds %Token, ptr %structptr, i32 0, i32 1
  %value = load ptr, ptr %value_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %value, ptr @.str.174)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i32 1

ifcont:                                           ; preds = %entry
  %structptr2 = load ptr, ptr %t1, align 8
  %value_ptr3 = getelementptr inbounds %Token, ptr %structptr2, i32 0, i32 1
  %value4 = load ptr, ptr %value_ptr3, align 8
  %calltmp5 = call i32 @str_equals(ptr %value4, ptr @.str.175)
  %eqtmp6 = icmp eq i32 %calltmp5, 1
  %ifcond7 = icmp ne i1 %eqtmp6, false
  br i1 %ifcond7, label %then8, label %ifcont9

then8:                                            ; preds = %ifcont
  ret i32 2

ifcont9:                                          ; preds = %ifcont
  %structptr10 = load ptr, ptr %t1, align 8
  %type_ptr = getelementptr inbounds %Token, ptr %structptr10, i32 0, i32 0
  %type = load i32, ptr %type_ptr, align 4
  %eqtmp11 = icmp eq i32 %type, 16
  %ifcond12 = icmp ne i1 %eqtmp11, false
  br i1 %ifcond12, label %then13, label %ifcont14

then13:                                           ; preds = %ifcont9
  ret i32 0

ifcont14:                                         ; preds = %ifcont9
  %structptr15 = load ptr, ptr %t1, align 8
  %value_ptr16 = getelementptr inbounds %Token, ptr %structptr15, i32 0, i32 1
  %value17 = load ptr, ptr %value_ptr16, align 8
  %calltmp18 = call i32 @str_equals(ptr %value17, ptr @.str.176)
  %eqtmp19 = icmp eq i32 %calltmp18, 1
  %structptr20 = load ptr, ptr %t1, align 8
  %value_ptr21 = getelementptr inbounds %Token, ptr %structptr20, i32 0, i32 1
  %value22 = load ptr, ptr %value_ptr21, align 8
  %calltmp23 = call i32 @str_equals(ptr %value22, ptr @.str.177)
  %eqtmp24 = icmp eq i32 %calltmp23, 1
  %ortmp = or i1 %eqtmp19, %eqtmp24
  %ifcond25 = icmp ne i1 %ortmp, false
  br i1 %ifcond25, label %then26, label %ifcont27

then26:                                           ; preds = %ifcont14
  ret i32 3

ifcont27:                                         ; preds = %ifcont14
  %structptr28 = load ptr, ptr %t1, align 8
  %value_ptr29 = getelementptr inbounds %Token, ptr %structptr28, i32 0, i32 1
  %value30 = load ptr, ptr %value_ptr29, align 8
  %calltmp31 = call i32 @str_equals(ptr %value30, ptr @.str.178)
  %eqtmp32 = icmp eq i32 %calltmp31, 1
  %structptr33 = load ptr, ptr %t1, align 8
  %value_ptr34 = getelementptr inbounds %Token, ptr %structptr33, i32 0, i32 1
  %value35 = load ptr, ptr %value_ptr34, align 8
  %calltmp36 = call i32 @str_equals(ptr %value35, ptr @.str.179)
  %eqtmp37 = icmp eq i32 %calltmp36, 1
  %structptr38 = load ptr, ptr %t1, align 8
  %value_ptr39 = getelementptr inbounds %Token, ptr %structptr38, i32 0, i32 1
  %value40 = load ptr, ptr %value_ptr39, align 8
  %calltmp41 = call i32 @str_equals(ptr %value40, ptr @.str.180)
  %eqtmp42 = icmp eq i32 %calltmp41, 1
  %structptr43 = load ptr, ptr %t1, align 8
  %value_ptr44 = getelementptr inbounds %Token, ptr %structptr43, i32 0, i32 1
  %value45 = load ptr, ptr %value_ptr44, align 8
  %calltmp46 = call i32 @str_equals(ptr %value45, ptr @.str.181)
  %eqtmp47 = icmp eq i32 %calltmp46, 1
  %ortmp48 = or i1 %eqtmp42, %eqtmp47
  %ortmp49 = or i1 %eqtmp37, %ortmp48
  %ortmp50 = or i1 %eqtmp32, %ortmp49
  %ifcond51 = icmp ne i1 %ortmp50, false
  br i1 %ifcond51, label %then52, label %ifcont53

then52:                                           ; preds = %ifcont27
  ret i32 4

ifcont53:                                         ; preds = %ifcont27
  %structptr54 = load ptr, ptr %t1, align 8
  %value_ptr55 = getelementptr inbounds %Token, ptr %structptr54, i32 0, i32 1
  %value56 = load ptr, ptr %value_ptr55, align 8
  %calltmp57 = call i32 @str_equals(ptr %value56, ptr @.str.182)
  %eqtmp58 = icmp eq i32 %calltmp57, 1
  %structptr59 = load ptr, ptr %t1, align 8
  %value_ptr60 = getelementptr inbounds %Token, ptr %structptr59, i32 0, i32 1
  %value61 = load ptr, ptr %value_ptr60, align 8
  %calltmp62 = call i32 @str_equals(ptr %value61, ptr @.str.183)
  %eqtmp63 = icmp eq i32 %calltmp62, 1
  %ortmp64 = or i1 %eqtmp58, %eqtmp63
  %ifcond65 = icmp ne i1 %ortmp64, false
  br i1 %ifcond65, label %then66, label %ifcont67

then66:                                           ; preds = %ifcont53
  ret i32 5

ifcont67:                                         ; preds = %ifcont53
  %structptr68 = load ptr, ptr %t1, align 8
  %value_ptr69 = getelementptr inbounds %Token, ptr %structptr68, i32 0, i32 1
  %value70 = load ptr, ptr %value_ptr69, align 8
  %calltmp71 = call i32 @str_equals(ptr %value70, ptr @.str.184)
  %eqtmp72 = icmp eq i32 %calltmp71, 1
  %structptr73 = load ptr, ptr %t1, align 8
  %value_ptr74 = getelementptr inbounds %Token, ptr %structptr73, i32 0, i32 1
  %value75 = load ptr, ptr %value_ptr74, align 8
  %calltmp76 = call i32 @str_equals(ptr %value75, ptr @.str.185)
  %eqtmp77 = icmp eq i32 %calltmp76, 1
  %structptr78 = load ptr, ptr %t1, align 8
  %value_ptr79 = getelementptr inbounds %Token, ptr %structptr78, i32 0, i32 1
  %value80 = load ptr, ptr %value_ptr79, align 8
  %calltmp81 = call i32 @str_equals(ptr %value80, ptr @.str.186)
  %eqtmp82 = icmp eq i32 %calltmp81, 1
  %ortmp83 = or i1 %eqtmp77, %eqtmp82
  %ortmp84 = or i1 %eqtmp72, %ortmp83
  %ifcond85 = icmp ne i1 %ortmp84, false
  br i1 %ifcond85, label %then86, label %ifcont87

then86:                                           ; preds = %ifcont67
  ret i32 6

ifcont87:                                         ; preds = %ifcont67
  ret i32 0
}

declare void @ir_reset()

declare void @ir_print()

declare i32 @ir_write_file(ptr)

declare void @ir_append(ptr)

declare void @ir_append_line(ptr)

declare i32 @ir_get_temp()

declare void @ir_module_start(ptr)

declare void @ir_module_end()

declare ptr @ir_type_void()

declare ptr @ir_type_i1()

declare ptr @ir_type_i8()

declare ptr @ir_type_i32()

declare ptr @ir_type_i64()

declare ptr @ir_type_i8_ptr()

declare void @ir_declare_function_begin(ptr, ptr)

declare void @ir_declare_function_param(ptr)

declare void @ir_declare_function_end()

declare void @ir_function_begin(ptr, ptr)

declare void @ir_function_param(ptr, ptr)

declare void @ir_function_body_start()

declare void @ir_function_end()

declare void @ir_call_begin()

declare void @ir_call_arg(ptr, ptr)

declare i32 @ir_call_end(ptr, ptr)

declare i32 @ir_get_label()

declare void @ir_label(ptr)

declare void @ir_label_numbered(i32)

declare i32 @ir_alloca(ptr, ptr)

declare i32 @ir_load(ptr, ptr)

declare void @ir_store(ptr, ptr, ptr)

declare i32 @ir_load_global(ptr, ptr)

declare void @ir_store_global(ptr, ptr, ptr)

declare i32 @ir_add(ptr, ptr, ptr)

declare i32 @ir_sub(ptr, ptr, ptr)

declare i32 @ir_mul(ptr, ptr, ptr)

declare i32 @ir_sdiv(ptr, ptr, ptr)

declare i32 @ir_srem(ptr, ptr, ptr)

declare i32 @ir_neg(ptr, ptr)

declare i32 @ir_and(ptr, ptr, ptr)

declare i32 @ir_or(ptr, ptr, ptr)

declare i32 @ir_icmp_eq(ptr, ptr, ptr)

declare i32 @ir_icmp_ne(ptr, ptr, ptr)

declare i32 @ir_icmp_slt(ptr, ptr, ptr)

declare i32 @ir_icmp_sle(ptr, ptr, ptr)

declare i32 @ir_icmp_sgt(ptr, ptr, ptr)

declare i32 @ir_icmp_sge(ptr, ptr, ptr)

declare void @ir_ret(ptr, ptr)

declare void @ir_ret_void()

declare void @ir_br(ptr)

declare void @ir_br_numbered(i32)

declare void @ir_cond_br(ptr, ptr, ptr)

declare void @ir_cond_br_numbered(ptr, i32, i32)

declare void @ir_global_string(ptr, ptr)

declare void @ir_global_var(ptr, ptr, ptr, i32)

declare ptr @ir_get_temp_name(i32)

declare ptr @ir_get_label_name(i32)

declare void @ir_register_global_name(ptr)

declare i32 @ir_is_global_name(ptr)

declare void @ir_reset_globals()

declare void @ir_reset_types()

declare void @ir_register_struct(ptr)

declare void @ir_register_struct_field(ptr, ptr, ptr)

declare i32 @ir_is_struct_type_name(ptr)

declare i32 @ir_get_struct_field_index(ptr, ptr)

declare ptr @ir_get_struct_field_type(ptr, ptr)

declare void @ir_register_enum_variant(ptr, ptr, i32)

declare i32 @ir_get_enum_variant(ptr, ptr)

declare void @ir_set_var_type(ptr, ptr)

declare ptr @ir_get_var_type(ptr)

declare void @ir_clear_var_types()

declare void @ir_clear_local_var_types()

declare void @ir_set_returned()

declare i32 @ir_has_returned()

declare void @ir_clear_returned()

declare void @ir_comment(ptr)

declare void @ir_blank_line()

define void @generate_statement(ptr %stmt) {
entry:
  %cond_val274 = alloca ptr, align 8
  %end_label266 = alloca i32, align 4
  %body_label = alloca i32, align 4
  %cond_label = alloca i32, align 4
  %else_node = alloca ptr, align 8
  %end_label = alloca i32, align 4
  %else_label = alloca i32, align 4
  %then_label = alloca i32, align 4
  %cond_val = alloca ptr, align 8
  %ret_val = alloca ptr, align 8
  %gep_name = alloca ptr, align 8
  %gep_temp = alloca i32, align 4
  %val125 = alloca ptr, align 8
  %field_type = alloca ptr, align 8
  %field_index = alloca i32, align 4
  %struct_name = alloca ptr, align 8
  %object_type = alloca ptr, align 8
  %object_val = alloca ptr, align 8
  %object_node = alloca ptr, align 8
  %val = alloca ptr, align 8
  %store_type73 = alloca ptr, align 8
  %var_type70 = alloca ptr, align 8
  %var_name67 = alloca ptr, align 8
  %target_node = alloca ptr, align 8
  %init_val = alloca ptr, align 8
  %store_type = alloca ptr, align 8
  %type_node = alloca ptr, align 8
  %var_type = alloca ptr, align 8
  %var_name = alloca ptr, align 8
  %stmt1 = alloca ptr, align 8
  store ptr %stmt, ptr %stmt1, align 8
  %structptr = load ptr, ptr %stmt1, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp = icmp eq i32 %kind, 3
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont47

then:                                             ; preds = %entry
  %structptr2 = load ptr, ptr %stmt1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  store ptr %s1, ptr %var_name, align 8
  store ptr @.str.393, ptr %var_type, align 8
  %structptr3 = load ptr, ptr %stmt1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr3, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %child1, ptr @.str.394)
  %eqtmp4 = icmp eq i32 %calltmp, 0
  %ifcond5 = icmp ne i1 %eqtmp4, false
  br i1 %ifcond5, label %then6, label %else

then6:                                            ; preds = %then
  %structptr7 = load ptr, ptr %stmt1, align 8
  %child1_ptr8 = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 5
  %child19 = load ptr, ptr %child1_ptr8, align 8
  %calltmp10 = call ptr @ptr_to_node(ptr %child19)
  store ptr %calltmp10, ptr %type_node, align 8
  %type_node11 = load ptr, ptr %type_node, align 8
  %calltmp12 = call ptr @map_type_node(ptr %type_node11)
  store ptr %calltmp12, ptr %var_type, align 8
  br label %ifcont23

else:                                             ; preds = %then
  %structptr13 = load ptr, ptr %stmt1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr13, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp14 = call i32 @str_equals(ptr %child2, ptr @.str.395)
  %eqtmp15 = icmp eq i32 %calltmp14, 0
  %ifcond16 = icmp ne i1 %eqtmp15, false
  br i1 %ifcond16, label %then17, label %ifcont

then17:                                           ; preds = %else
  %structptr18 = load ptr, ptr %stmt1, align 8
  %child2_ptr19 = getelementptr inbounds %ASTNode, ptr %structptr18, i32 0, i32 6
  %child220 = load ptr, ptr %child2_ptr19, align 8
  %calltmp21 = call ptr @ptr_to_node(ptr %child220)
  %calltmp22 = call ptr @get_expr_type(ptr %calltmp21)
  store ptr %calltmp22, ptr %var_type, align 8
  br label %ifcont

ifcont:                                           ; preds = %then17, %else
  br label %ifcont23

ifcont23:                                         ; preds = %ifcont, %then6
  %var_name24 = load ptr, ptr %var_name, align 8
  %var_type25 = load ptr, ptr %var_type, align 8
  call void @ir_set_var_type(ptr %var_name24, ptr %var_type25)
  %var_type26 = load ptr, ptr %var_type, align 8
  %calltmp27 = call ptr @storage_type(ptr %var_type26)
  store ptr %calltmp27, ptr %store_type, align 8
  %store_type28 = load ptr, ptr %store_type, align 8
  %var_name29 = load ptr, ptr %var_name, align 8
  %calltmp30 = call i32 @ir_alloca(ptr %store_type28, ptr %var_name29)
  %structptr31 = load ptr, ptr %stmt1, align 8
  %child2_ptr32 = getelementptr inbounds %ASTNode, ptr %structptr31, i32 0, i32 6
  %child233 = load ptr, ptr %child2_ptr32, align 8
  %calltmp34 = call i32 @str_equals(ptr %child233, ptr @.str.396)
  %eqtmp35 = icmp eq i32 %calltmp34, 0
  %ifcond36 = icmp ne i1 %eqtmp35, false
  br i1 %ifcond36, label %then37, label %ifcont46

then37:                                           ; preds = %ifcont23
  %structptr38 = load ptr, ptr %stmt1, align 8
  %child2_ptr39 = getelementptr inbounds %ASTNode, ptr %structptr38, i32 0, i32 6
  %child240 = load ptr, ptr %child2_ptr39, align 8
  %calltmp41 = call ptr @ptr_to_node(ptr %child240)
  %calltmp42 = call ptr @generate_expression(ptr %calltmp41)
  store ptr %calltmp42, ptr %init_val, align 8
  %store_type43 = load ptr, ptr %store_type, align 8
  %init_val44 = load ptr, ptr %init_val, align 8
  %var_name45 = load ptr, ptr %var_name, align 8
  call void @ir_store(ptr %store_type43, ptr %init_val44, ptr %var_name45)
  br label %ifcont46

ifcont46:                                         ; preds = %then37, %ifcont23
  br label %ifcont47

ifcont47:                                         ; preds = %ifcont46, %entry
  %structptr48 = load ptr, ptr %stmt1, align 8
  %kind_ptr49 = getelementptr inbounds %ASTNode, ptr %structptr48, i32 0, i32 0
  %kind50 = load i32, ptr %kind_ptr49, align 4
  %eqtmp51 = icmp eq i32 %kind50, 16
  %ifcond52 = icmp ne i1 %eqtmp51, false
  br i1 %ifcond52, label %then53, label %ifcont139

then53:                                           ; preds = %ifcont47
  %structptr54 = load ptr, ptr %stmt1, align 8
  %child1_ptr55 = getelementptr inbounds %ASTNode, ptr %structptr54, i32 0, i32 5
  %child156 = load ptr, ptr %child1_ptr55, align 8
  %calltmp57 = call ptr @ptr_to_node(ptr %child156)
  store ptr %calltmp57, ptr %target_node, align 8
  %structptr58 = load ptr, ptr %target_node, align 8
  %kind_ptr59 = getelementptr inbounds %ASTNode, ptr %structptr58, i32 0, i32 0
  %kind60 = load i32, ptr %kind_ptr59, align 4
  %eqtmp61 = icmp eq i32 %kind60, 23
  %ifcond62 = icmp ne i1 %eqtmp61, false
  br i1 %ifcond62, label %then63, label %ifcont92

then63:                                           ; preds = %then53
  %structptr64 = load ptr, ptr %target_node, align 8
  %s1_ptr65 = getelementptr inbounds %ASTNode, ptr %structptr64, i32 0, i32 1
  %s166 = load ptr, ptr %s1_ptr65, align 8
  store ptr %s166, ptr %var_name67, align 8
  %var_name68 = load ptr, ptr %var_name67, align 8
  %calltmp69 = call ptr @ir_get_var_type(ptr %var_name68)
  store ptr %calltmp69, ptr %var_type70, align 8
  %var_type71 = load ptr, ptr %var_type70, align 8
  %calltmp72 = call ptr @storage_type(ptr %var_type71)
  store ptr %calltmp72, ptr %store_type73, align 8
  %structptr74 = load ptr, ptr %stmt1, align 8
  %child2_ptr75 = getelementptr inbounds %ASTNode, ptr %structptr74, i32 0, i32 6
  %child276 = load ptr, ptr %child2_ptr75, align 8
  %calltmp77 = call ptr @ptr_to_node(ptr %child276)
  %calltmp78 = call ptr @generate_expression(ptr %calltmp77)
  store ptr %calltmp78, ptr %val, align 8
  %var_name79 = load ptr, ptr %var_name67, align 8
  %calltmp80 = call i32 @ir_is_global_name(ptr %var_name79)
  %eqtmp81 = icmp eq i32 %calltmp80, 1
  %ifcond82 = icmp ne i1 %eqtmp81, false
  br i1 %ifcond82, label %then83, label %else87

then83:                                           ; preds = %then63
  %store_type84 = load ptr, ptr %store_type73, align 8
  %val85 = load ptr, ptr %val, align 8
  %var_name86 = load ptr, ptr %var_name67, align 8
  call void @ir_store_global(ptr %store_type84, ptr %val85, ptr %var_name86)
  br label %ifcont91

else87:                                           ; preds = %then63
  %store_type88 = load ptr, ptr %store_type73, align 8
  %val89 = load ptr, ptr %val, align 8
  %var_name90 = load ptr, ptr %var_name67, align 8
  call void @ir_store(ptr %store_type88, ptr %val89, ptr %var_name90)
  br label %ifcont91

ifcont91:                                         ; preds = %else87, %then83
  br label %ifcont92

ifcont92:                                         ; preds = %ifcont91, %then53
  %structptr93 = load ptr, ptr %target_node, align 8
  %kind_ptr94 = getelementptr inbounds %ASTNode, ptr %structptr93, i32 0, i32 0
  %kind95 = load i32, ptr %kind_ptr94, align 4
  %eqtmp96 = icmp eq i32 %kind95, 25
  %ifcond97 = icmp ne i1 %eqtmp96, false
  br i1 %ifcond97, label %then98, label %ifcont138

then98:                                           ; preds = %ifcont92
  %structptr99 = load ptr, ptr %target_node, align 8
  %child1_ptr100 = getelementptr inbounds %ASTNode, ptr %structptr99, i32 0, i32 5
  %child1101 = load ptr, ptr %child1_ptr100, align 8
  %calltmp102 = call ptr @ptr_to_node(ptr %child1101)
  store ptr %calltmp102, ptr %object_node, align 8
  %object_node103 = load ptr, ptr %object_node, align 8
  %calltmp104 = call ptr @generate_expression(ptr %object_node103)
  store ptr %calltmp104, ptr %object_val, align 8
  %object_node105 = load ptr, ptr %object_node, align 8
  %calltmp106 = call ptr @get_expr_type(ptr %object_node105)
  store ptr %calltmp106, ptr %object_type, align 8
  %object_type107 = load ptr, ptr %object_type, align 8
  %calltmp108 = call ptr @struct_type_name(ptr %object_type107)
  store ptr %calltmp108, ptr %struct_name, align 8
  %struct_name109 = load ptr, ptr %struct_name, align 8
  %structptr110 = load ptr, ptr %target_node, align 8
  %s1_ptr111 = getelementptr inbounds %ASTNode, ptr %structptr110, i32 0, i32 1
  %s1112 = load ptr, ptr %s1_ptr111, align 8
  %calltmp113 = call i32 @ir_get_struct_field_index(ptr %struct_name109, ptr %s1112)
  store i32 %calltmp113, ptr %field_index, align 4
  %struct_name114 = load ptr, ptr %struct_name, align 8
  %structptr115 = load ptr, ptr %target_node, align 8
  %s1_ptr116 = getelementptr inbounds %ASTNode, ptr %structptr115, i32 0, i32 1
  %s1117 = load ptr, ptr %s1_ptr116, align 8
  %calltmp118 = call ptr @ir_get_struct_field_type(ptr %struct_name114, ptr %s1117)
  %calltmp119 = call ptr @storage_type(ptr %calltmp118)
  store ptr %calltmp119, ptr %field_type, align 8
  %structptr120 = load ptr, ptr %stmt1, align 8
  %child2_ptr121 = getelementptr inbounds %ASTNode, ptr %structptr120, i32 0, i32 6
  %child2122 = load ptr, ptr %child2_ptr121, align 8
  %calltmp123 = call ptr @ptr_to_node(ptr %child2122)
  %calltmp124 = call ptr @generate_expression(ptr %calltmp123)
  store ptr %calltmp124, ptr %val125, align 8
  %calltmp126 = call i32 @ir_get_temp()
  store i32 %calltmp126, ptr %gep_temp, align 4
  %gep_temp127 = load i32, ptr %gep_temp, align 4
  %calltmp128 = call ptr @ir_get_temp_name(i32 %gep_temp127)
  store ptr %calltmp128, ptr %gep_name, align 8
  call void @ir_append(ptr @.str.397)
  %gep_name129 = load ptr, ptr %gep_name, align 8
  call void @ir_append(ptr %gep_name129)
  call void @ir_append(ptr @.str.398)
  %struct_name130 = load ptr, ptr %struct_name, align 8
  %calltmp131 = call ptr @str_concat(ptr @.str.399, ptr %struct_name130)
  call void @ir_append(ptr %calltmp131)
  call void @ir_append(ptr @.str.400)
  %object_val132 = load ptr, ptr %object_val, align 8
  call void @ir_append(ptr %object_val132)
  call void @ir_append(ptr @.str.401)
  %field_index133 = load i32, ptr %field_index, align 4
  %calltmp134 = call ptr @int_to_str(i32 %field_index133)
  call void @ir_append_line(ptr %calltmp134)
  call void @ir_append(ptr @.str.402)
  %field_type135 = load ptr, ptr %field_type, align 8
  call void @ir_append(ptr %field_type135)
  call void @ir_append(ptr @.str.403)
  %val136 = load ptr, ptr %val125, align 8
  call void @ir_append(ptr %val136)
  call void @ir_append(ptr @.str.404)
  %gep_name137 = load ptr, ptr %gep_name, align 8
  call void @ir_append_line(ptr %gep_name137)
  br label %ifcont138

ifcont138:                                        ; preds = %then98, %ifcont92
  br label %ifcont139

ifcont139:                                        ; preds = %ifcont138, %ifcont47
  %structptr140 = load ptr, ptr %stmt1, align 8
  %kind_ptr141 = getelementptr inbounds %ASTNode, ptr %structptr140, i32 0, i32 0
  %kind142 = load i32, ptr %kind_ptr141, align 4
  %eqtmp143 = icmp eq i32 %kind142, 15
  %ifcond144 = icmp ne i1 %eqtmp143, false
  br i1 %ifcond144, label %then145, label %ifcont167

then145:                                          ; preds = %ifcont139
  %structptr146 = load ptr, ptr %stmt1, align 8
  %child1_ptr147 = getelementptr inbounds %ASTNode, ptr %structptr146, i32 0, i32 5
  %child1148 = load ptr, ptr %child1_ptr147, align 8
  %calltmp149 = call i32 @str_equals(ptr %child1148, ptr @.str.405)
  %eqtmp150 = icmp eq i32 %calltmp149, 0
  %ifcond151 = icmp ne i1 %eqtmp150, false
  br i1 %ifcond151, label %then152, label %else165

then152:                                          ; preds = %then145
  %structptr153 = load ptr, ptr %stmt1, align 8
  %child1_ptr154 = getelementptr inbounds %ASTNode, ptr %structptr153, i32 0, i32 5
  %child1155 = load ptr, ptr %child1_ptr154, align 8
  %calltmp156 = call ptr @ptr_to_node(ptr %child1155)
  %calltmp157 = call ptr @generate_expression(ptr %calltmp156)
  store ptr %calltmp157, ptr %ret_val, align 8
  %structptr158 = load ptr, ptr %stmt1, align 8
  %child1_ptr159 = getelementptr inbounds %ASTNode, ptr %structptr158, i32 0, i32 5
  %child1160 = load ptr, ptr %child1_ptr159, align 8
  %calltmp161 = call ptr @ptr_to_node(ptr %child1160)
  %calltmp162 = call ptr @get_expr_type(ptr %calltmp161)
  %calltmp163 = call ptr @storage_type(ptr %calltmp162)
  %ret_val164 = load ptr, ptr %ret_val, align 8
  call void @ir_ret(ptr %calltmp163, ptr %ret_val164)
  br label %ifcont166

else165:                                          ; preds = %then145
  call void @ir_ret_void()
  br label %ifcont166

ifcont166:                                        ; preds = %else165, %then152
  call void @ir_set_returned()
  br label %ifcont167

ifcont167:                                        ; preds = %ifcont166, %ifcont139
  %structptr168 = load ptr, ptr %stmt1, align 8
  %kind_ptr169 = getelementptr inbounds %ASTNode, ptr %structptr168, i32 0, i32 0
  %kind170 = load i32, ptr %kind_ptr169, align 4
  %eqtmp171 = icmp eq i32 %kind170, 17
  %ifcond172 = icmp ne i1 %eqtmp171, false
  br i1 %ifcond172, label %then173, label %ifcont187

then173:                                          ; preds = %ifcont167
  %structptr174 = load ptr, ptr %stmt1, align 8
  %child1_ptr175 = getelementptr inbounds %ASTNode, ptr %structptr174, i32 0, i32 5
  %child1176 = load ptr, ptr %child1_ptr175, align 8
  %calltmp177 = call i32 @str_equals(ptr %child1176, ptr @.str.406)
  %eqtmp178 = icmp eq i32 %calltmp177, 0
  %ifcond179 = icmp ne i1 %eqtmp178, false
  br i1 %ifcond179, label %then180, label %ifcont186

then180:                                          ; preds = %then173
  %structptr181 = load ptr, ptr %stmt1, align 8
  %child1_ptr182 = getelementptr inbounds %ASTNode, ptr %structptr181, i32 0, i32 5
  %child1183 = load ptr, ptr %child1_ptr182, align 8
  %calltmp184 = call ptr @ptr_to_node(ptr %child1183)
  %calltmp185 = call ptr @generate_expression(ptr %calltmp184)
  br label %ifcont186

ifcont186:                                        ; preds = %then180, %then173
  br label %ifcont187

ifcont187:                                        ; preds = %ifcont186, %ifcont167
  %structptr188 = load ptr, ptr %stmt1, align 8
  %kind_ptr189 = getelementptr inbounds %ASTNode, ptr %structptr188, i32 0, i32 0
  %kind190 = load i32, ptr %kind_ptr189, align 4
  %eqtmp191 = icmp eq i32 %kind190, 10
  %ifcond192 = icmp ne i1 %eqtmp191, false
  br i1 %ifcond192, label %then193, label %ifcont256

then193:                                          ; preds = %ifcont187
  %structptr194 = load ptr, ptr %stmt1, align 8
  %child1_ptr195 = getelementptr inbounds %ASTNode, ptr %structptr194, i32 0, i32 5
  %child1196 = load ptr, ptr %child1_ptr195, align 8
  %calltmp197 = call ptr @ptr_to_node(ptr %child1196)
  %calltmp198 = call ptr @generate_expression(ptr %calltmp197)
  store ptr %calltmp198, ptr %cond_val, align 8
  %calltmp199 = call i32 @ir_get_label()
  store i32 %calltmp199, ptr %then_label, align 4
  %calltmp200 = call i32 @ir_get_label()
  store i32 %calltmp200, ptr %else_label, align 4
  %calltmp201 = call i32 @ir_get_label()
  store i32 %calltmp201, ptr %end_label, align 4
  %structptr202 = load ptr, ptr %stmt1, align 8
  %child3_ptr = getelementptr inbounds %ASTNode, ptr %structptr202, i32 0, i32 7
  %child3 = load ptr, ptr %child3_ptr, align 8
  %calltmp203 = call i32 @str_equals(ptr %child3, ptr @.str.407)
  %eqtmp204 = icmp eq i32 %calltmp203, 0
  %ifcond205 = icmp ne i1 %eqtmp204, false
  br i1 %ifcond205, label %then206, label %else210

then206:                                          ; preds = %then193
  %cond_val207 = load ptr, ptr %cond_val, align 8
  %then_label208 = load i32, ptr %then_label, align 4
  %else_label209 = load i32, ptr %else_label, align 4
  call void @ir_cond_br_numbered(ptr %cond_val207, i32 %then_label208, i32 %else_label209)
  br label %ifcont214

else210:                                          ; preds = %then193
  %cond_val211 = load ptr, ptr %cond_val, align 8
  %then_label212 = load i32, ptr %then_label, align 4
  %end_label213 = load i32, ptr %end_label, align 4
  call void @ir_cond_br_numbered(ptr %cond_val211, i32 %then_label212, i32 %end_label213)
  br label %ifcont214

ifcont214:                                        ; preds = %else210, %then206
  %then_label215 = load i32, ptr %then_label, align 4
  call void @ir_label_numbered(i32 %then_label215)
  %structptr216 = load ptr, ptr %stmt1, align 8
  %child2_ptr217 = getelementptr inbounds %ASTNode, ptr %structptr216, i32 0, i32 6
  %child2218 = load ptr, ptr %child2_ptr217, align 8
  %calltmp219 = call ptr @ptr_to_node(ptr %child2218)
  call void @generate_block(ptr %calltmp219)
  %calltmp220 = call i32 @ir_has_returned()
  %eqtmp221 = icmp eq i32 %calltmp220, 0
  %ifcond222 = icmp ne i1 %eqtmp221, false
  br i1 %ifcond222, label %then223, label %ifcont225

then223:                                          ; preds = %ifcont214
  %end_label224 = load i32, ptr %end_label, align 4
  call void @ir_br_numbered(i32 %end_label224)
  br label %ifcont225

ifcont225:                                        ; preds = %then223, %ifcont214
  call void @ir_clear_returned()
  %structptr226 = load ptr, ptr %stmt1, align 8
  %child3_ptr227 = getelementptr inbounds %ASTNode, ptr %structptr226, i32 0, i32 7
  %child3228 = load ptr, ptr %child3_ptr227, align 8
  %calltmp229 = call i32 @str_equals(ptr %child3228, ptr @.str.408)
  %eqtmp230 = icmp eq i32 %calltmp229, 0
  %ifcond231 = icmp ne i1 %eqtmp230, false
  br i1 %ifcond231, label %then232, label %ifcont254

then232:                                          ; preds = %ifcont225
  %else_label233 = load i32, ptr %else_label, align 4
  call void @ir_label_numbered(i32 %else_label233)
  %structptr234 = load ptr, ptr %stmt1, align 8
  %child3_ptr235 = getelementptr inbounds %ASTNode, ptr %structptr234, i32 0, i32 7
  %child3236 = load ptr, ptr %child3_ptr235, align 8
  %calltmp237 = call ptr @ptr_to_node(ptr %child3236)
  store ptr %calltmp237, ptr %else_node, align 8
  %structptr238 = load ptr, ptr %else_node, align 8
  %kind_ptr239 = getelementptr inbounds %ASTNode, ptr %structptr238, i32 0, i32 0
  %kind240 = load i32, ptr %kind_ptr239, align 4
  %eqtmp241 = icmp eq i32 %kind240, 10
  %ifcond242 = icmp ne i1 %eqtmp241, false
  br i1 %ifcond242, label %then243, label %else245

then243:                                          ; preds = %then232
  %else_node244 = load ptr, ptr %else_node, align 8
  call void @generate_statement(ptr %else_node244)
  br label %ifcont247

else245:                                          ; preds = %then232
  %else_node246 = load ptr, ptr %else_node, align 8
  call void @generate_block(ptr %else_node246)
  br label %ifcont247

ifcont247:                                        ; preds = %else245, %then243
  %calltmp248 = call i32 @ir_has_returned()
  %eqtmp249 = icmp eq i32 %calltmp248, 0
  %ifcond250 = icmp ne i1 %eqtmp249, false
  br i1 %ifcond250, label %then251, label %ifcont253

then251:                                          ; preds = %ifcont247
  %end_label252 = load i32, ptr %end_label, align 4
  call void @ir_br_numbered(i32 %end_label252)
  br label %ifcont253

ifcont253:                                        ; preds = %then251, %ifcont247
  call void @ir_clear_returned()
  br label %ifcont254

ifcont254:                                        ; preds = %ifcont253, %ifcont225
  %end_label255 = load i32, ptr %end_label, align 4
  call void @ir_label_numbered(i32 %end_label255)
  br label %ifcont256

ifcont256:                                        ; preds = %ifcont254, %ifcont187
  %structptr257 = load ptr, ptr %stmt1, align 8
  %kind_ptr258 = getelementptr inbounds %ASTNode, ptr %structptr257, i32 0, i32 0
  %kind259 = load i32, ptr %kind_ptr258, align 4
  %eqtmp260 = icmp eq i32 %kind259, 13
  %ifcond261 = icmp ne i1 %eqtmp260, false
  br i1 %ifcond261, label %then262, label %ifcont290

then262:                                          ; preds = %ifcont256
  %calltmp263 = call i32 @ir_get_label()
  store i32 %calltmp263, ptr %cond_label, align 4
  %calltmp264 = call i32 @ir_get_label()
  store i32 %calltmp264, ptr %body_label, align 4
  %calltmp265 = call i32 @ir_get_label()
  store i32 %calltmp265, ptr %end_label266, align 4
  %cond_label267 = load i32, ptr %cond_label, align 4
  call void @ir_br_numbered(i32 %cond_label267)
  %cond_label268 = load i32, ptr %cond_label, align 4
  call void @ir_label_numbered(i32 %cond_label268)
  %structptr269 = load ptr, ptr %stmt1, align 8
  %child1_ptr270 = getelementptr inbounds %ASTNode, ptr %structptr269, i32 0, i32 5
  %child1271 = load ptr, ptr %child1_ptr270, align 8
  %calltmp272 = call ptr @ptr_to_node(ptr %child1271)
  %calltmp273 = call ptr @generate_expression(ptr %calltmp272)
  store ptr %calltmp273, ptr %cond_val274, align 8
  %cond_val275 = load ptr, ptr %cond_val274, align 8
  %body_label276 = load i32, ptr %body_label, align 4
  %end_label277 = load i32, ptr %end_label266, align 4
  call void @ir_cond_br_numbered(ptr %cond_val275, i32 %body_label276, i32 %end_label277)
  %body_label278 = load i32, ptr %body_label, align 4
  call void @ir_label_numbered(i32 %body_label278)
  %structptr279 = load ptr, ptr %stmt1, align 8
  %child2_ptr280 = getelementptr inbounds %ASTNode, ptr %structptr279, i32 0, i32 6
  %child2281 = load ptr, ptr %child2_ptr280, align 8
  %calltmp282 = call ptr @ptr_to_node(ptr %child2281)
  call void @generate_block(ptr %calltmp282)
  %calltmp283 = call i32 @ir_has_returned()
  %eqtmp284 = icmp eq i32 %calltmp283, 0
  %ifcond285 = icmp ne i1 %eqtmp284, false
  br i1 %ifcond285, label %then286, label %ifcont288

then286:                                          ; preds = %then262
  %cond_label287 = load i32, ptr %cond_label, align 4
  call void @ir_br_numbered(i32 %cond_label287)
  br label %ifcont288

ifcont288:                                        ; preds = %then286, %then262
  call void @ir_clear_returned()
  %end_label289 = load i32, ptr %end_label266, align 4
  call void @ir_label_numbered(i32 %end_label289)
  br label %ifcont290

ifcont290:                                        ; preds = %ifcont288, %ifcont256
  ret void
}

define void @generate_block(ptr %block) {
entry:
  %stmt = alloca ptr, align 8
  %stmt_ptr = alloca ptr, align 8
  %block1 = alloca ptr, align 8
  store ptr %block, ptr %block1, align 8
  %structptr = load ptr, ptr %block1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %stmt_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %stmt_ptr2 = load ptr, ptr %stmt_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %stmt_ptr2, ptr @.str.409)
  %eqtmp = icmp eq i32 %calltmp, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %stmt_ptr3 = load ptr, ptr %stmt_ptr, align 8
  %calltmp4 = call ptr @ptr_to_node(ptr %stmt_ptr3)
  store ptr %calltmp4, ptr %stmt, align 8
  %stmt5 = load ptr, ptr %stmt, align 8
  call void @generate_statement(ptr %stmt5)
  %structptr6 = load ptr, ptr %stmt, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %stmt_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret void
}

define void @collect_strings_stmt(ptr %stmt) {
entry:
  %else_node = alloca ptr, align 8
  %stmt1 = alloca ptr, align 8
  store ptr %stmt, ptr %stmt1, align 8
  %structptr = load ptr, ptr %stmt1, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp = icmp eq i32 %kind, 3
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont10

then:                                             ; preds = %entry
  %structptr2 = load ptr, ptr %stmt1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %child2, ptr @.str.451)
  %eqtmp3 = icmp eq i32 %calltmp, 0
  %ifcond4 = icmp ne i1 %eqtmp3, false
  br i1 %ifcond4, label %then5, label %ifcont

then5:                                            ; preds = %then
  %structptr6 = load ptr, ptr %stmt1, align 8
  %child2_ptr7 = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 6
  %child28 = load ptr, ptr %child2_ptr7, align 8
  %calltmp9 = call ptr @ptr_to_node(ptr %child28)
  call void @collect_strings_expr(ptr %calltmp9)
  br label %ifcont

ifcont:                                           ; preds = %then5, %then
  br label %ifcont10

ifcont10:                                         ; preds = %ifcont, %entry
  %structptr11 = load ptr, ptr %stmt1, align 8
  %kind_ptr12 = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 0
  %kind13 = load i32, ptr %kind_ptr12, align 4
  %eqtmp14 = icmp eq i32 %kind13, 17
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont27

then16:                                           ; preds = %ifcont10
  %structptr17 = load ptr, ptr %stmt1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr17, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp18 = call i32 @str_equals(ptr %child1, ptr @.str.452)
  %eqtmp19 = icmp eq i32 %calltmp18, 0
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont26

then21:                                           ; preds = %then16
  %structptr22 = load ptr, ptr %stmt1, align 8
  %child1_ptr23 = getelementptr inbounds %ASTNode, ptr %structptr22, i32 0, i32 5
  %child124 = load ptr, ptr %child1_ptr23, align 8
  %calltmp25 = call ptr @ptr_to_node(ptr %child124)
  call void @collect_strings_expr(ptr %calltmp25)
  br label %ifcont26

ifcont26:                                         ; preds = %then21, %then16
  br label %ifcont27

ifcont27:                                         ; preds = %ifcont26, %ifcont10
  %structptr28 = load ptr, ptr %stmt1, align 8
  %kind_ptr29 = getelementptr inbounds %ASTNode, ptr %structptr28, i32 0, i32 0
  %kind30 = load i32, ptr %kind_ptr29, align 4
  %eqtmp31 = icmp eq i32 %kind30, 15
  %ifcond32 = icmp ne i1 %eqtmp31, false
  br i1 %ifcond32, label %then33, label %ifcont46

then33:                                           ; preds = %ifcont27
  %structptr34 = load ptr, ptr %stmt1, align 8
  %child1_ptr35 = getelementptr inbounds %ASTNode, ptr %structptr34, i32 0, i32 5
  %child136 = load ptr, ptr %child1_ptr35, align 8
  %calltmp37 = call i32 @str_equals(ptr %child136, ptr @.str.453)
  %eqtmp38 = icmp eq i32 %calltmp37, 0
  %ifcond39 = icmp ne i1 %eqtmp38, false
  br i1 %ifcond39, label %then40, label %ifcont45

then40:                                           ; preds = %then33
  %structptr41 = load ptr, ptr %stmt1, align 8
  %child1_ptr42 = getelementptr inbounds %ASTNode, ptr %structptr41, i32 0, i32 5
  %child143 = load ptr, ptr %child1_ptr42, align 8
  %calltmp44 = call ptr @ptr_to_node(ptr %child143)
  call void @collect_strings_expr(ptr %calltmp44)
  br label %ifcont45

ifcont45:                                         ; preds = %then40, %then33
  br label %ifcont46

ifcont46:                                         ; preds = %ifcont45, %ifcont27
  %structptr47 = load ptr, ptr %stmt1, align 8
  %kind_ptr48 = getelementptr inbounds %ASTNode, ptr %structptr47, i32 0, i32 0
  %kind49 = load i32, ptr %kind_ptr48, align 4
  %eqtmp50 = icmp eq i32 %kind49, 16
  %ifcond51 = icmp ne i1 %eqtmp50, false
  br i1 %ifcond51, label %then52, label %ifcont65

then52:                                           ; preds = %ifcont46
  %structptr53 = load ptr, ptr %stmt1, align 8
  %child2_ptr54 = getelementptr inbounds %ASTNode, ptr %structptr53, i32 0, i32 6
  %child255 = load ptr, ptr %child2_ptr54, align 8
  %calltmp56 = call i32 @str_equals(ptr %child255, ptr @.str.454)
  %eqtmp57 = icmp eq i32 %calltmp56, 0
  %ifcond58 = icmp ne i1 %eqtmp57, false
  br i1 %ifcond58, label %then59, label %ifcont64

then59:                                           ; preds = %then52
  %structptr60 = load ptr, ptr %stmt1, align 8
  %child2_ptr61 = getelementptr inbounds %ASTNode, ptr %structptr60, i32 0, i32 6
  %child262 = load ptr, ptr %child2_ptr61, align 8
  %calltmp63 = call ptr @ptr_to_node(ptr %child262)
  call void @collect_strings_expr(ptr %calltmp63)
  br label %ifcont64

ifcont64:                                         ; preds = %then59, %then52
  br label %ifcont65

ifcont65:                                         ; preds = %ifcont64, %ifcont46
  %structptr66 = load ptr, ptr %stmt1, align 8
  %kind_ptr67 = getelementptr inbounds %ASTNode, ptr %structptr66, i32 0, i32 0
  %kind68 = load i32, ptr %kind_ptr67, align 4
  %eqtmp69 = icmp eq i32 %kind68, 10
  %ifcond70 = icmp ne i1 %eqtmp69, false
  br i1 %ifcond70, label %then71, label %ifcont99

then71:                                           ; preds = %ifcont65
  %structptr72 = load ptr, ptr %stmt1, align 8
  %child1_ptr73 = getelementptr inbounds %ASTNode, ptr %structptr72, i32 0, i32 5
  %child174 = load ptr, ptr %child1_ptr73, align 8
  %calltmp75 = call ptr @ptr_to_node(ptr %child174)
  call void @collect_strings_expr(ptr %calltmp75)
  %structptr76 = load ptr, ptr %stmt1, align 8
  %child2_ptr77 = getelementptr inbounds %ASTNode, ptr %structptr76, i32 0, i32 6
  %child278 = load ptr, ptr %child2_ptr77, align 8
  %calltmp79 = call ptr @ptr_to_node(ptr %child278)
  call void @collect_strings_block(ptr %calltmp79)
  %structptr80 = load ptr, ptr %stmt1, align 8
  %child3_ptr = getelementptr inbounds %ASTNode, ptr %structptr80, i32 0, i32 7
  %child3 = load ptr, ptr %child3_ptr, align 8
  %calltmp81 = call i32 @str_equals(ptr %child3, ptr @.str.455)
  %eqtmp82 = icmp eq i32 %calltmp81, 0
  %ifcond83 = icmp ne i1 %eqtmp82, false
  br i1 %ifcond83, label %then84, label %ifcont98

then84:                                           ; preds = %then71
  %structptr85 = load ptr, ptr %stmt1, align 8
  %child3_ptr86 = getelementptr inbounds %ASTNode, ptr %structptr85, i32 0, i32 7
  %child387 = load ptr, ptr %child3_ptr86, align 8
  %calltmp88 = call ptr @ptr_to_node(ptr %child387)
  store ptr %calltmp88, ptr %else_node, align 8
  %structptr89 = load ptr, ptr %else_node, align 8
  %kind_ptr90 = getelementptr inbounds %ASTNode, ptr %structptr89, i32 0, i32 0
  %kind91 = load i32, ptr %kind_ptr90, align 4
  %eqtmp92 = icmp eq i32 %kind91, 10
  %ifcond93 = icmp ne i1 %eqtmp92, false
  br i1 %ifcond93, label %then94, label %else

then94:                                           ; preds = %then84
  %else_node95 = load ptr, ptr %else_node, align 8
  call void @collect_strings_stmt(ptr %else_node95)
  br label %ifcont97

else:                                             ; preds = %then84
  %else_node96 = load ptr, ptr %else_node, align 8
  call void @collect_strings_block(ptr %else_node96)
  br label %ifcont97

ifcont97:                                         ; preds = %else, %then94
  br label %ifcont98

ifcont98:                                         ; preds = %ifcont97, %then71
  br label %ifcont99

ifcont99:                                         ; preds = %ifcont98, %ifcont65
  %structptr100 = load ptr, ptr %stmt1, align 8
  %kind_ptr101 = getelementptr inbounds %ASTNode, ptr %structptr100, i32 0, i32 0
  %kind102 = load i32, ptr %kind_ptr101, align 4
  %eqtmp103 = icmp eq i32 %kind102, 13
  %ifcond104 = icmp ne i1 %eqtmp103, false
  br i1 %ifcond104, label %then105, label %ifcont114

then105:                                          ; preds = %ifcont99
  %structptr106 = load ptr, ptr %stmt1, align 8
  %child1_ptr107 = getelementptr inbounds %ASTNode, ptr %structptr106, i32 0, i32 5
  %child1108 = load ptr, ptr %child1_ptr107, align 8
  %calltmp109 = call ptr @ptr_to_node(ptr %child1108)
  call void @collect_strings_expr(ptr %calltmp109)
  %structptr110 = load ptr, ptr %stmt1, align 8
  %child2_ptr111 = getelementptr inbounds %ASTNode, ptr %structptr110, i32 0, i32 6
  %child2112 = load ptr, ptr %child2_ptr111, align 8
  %calltmp113 = call ptr @ptr_to_node(ptr %child2112)
  call void @collect_strings_block(ptr %calltmp113)
  br label %ifcont114

ifcont114:                                        ; preds = %then105, %ifcont99
  ret void
}

define void @collect_strings_block(ptr %block) {
entry:
  %s = alloca ptr, align 8
  %s_ptr = alloca ptr, align 8
  %block1 = alloca ptr, align 8
  store ptr %block, ptr %block1, align 8
  %structptr = load ptr, ptr %block1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %s_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %s_ptr2 = load ptr, ptr %s_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %s_ptr2, ptr @.str.456)
  %eqtmp = icmp eq i32 %calltmp, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %s_ptr3 = load ptr, ptr %s_ptr, align 8
  %calltmp4 = call ptr @ptr_to_node(ptr %s_ptr3)
  store ptr %calltmp4, ptr %s, align 8
  %s5 = load ptr, ptr %s, align 8
  call void @collect_strings_stmt(ptr %s5)
  %structptr6 = load ptr, ptr %s, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %s_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret void
}

define ptr @map_type(ptr %t) {
entry:
  %t1 = alloca ptr, align 8
  store ptr %t, ptr %t1, align 8
  %t2 = load ptr, ptr %t1, align 8
  %calltmp = call i32 @str_equals(ptr %t2, ptr @.str.228)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret ptr @.str.229

ifcont:                                           ; preds = %entry
  %t3 = load ptr, ptr %t1, align 8
  %calltmp4 = call i32 @str_equals(ptr %t3, ptr @.str.230)
  %eqtmp5 = icmp eq i32 %calltmp4, 1
  %ifcond6 = icmp ne i1 %eqtmp5, false
  br i1 %ifcond6, label %then7, label %ifcont8

then7:                                            ; preds = %ifcont
  ret ptr @.str.231

ifcont8:                                          ; preds = %ifcont
  %t9 = load ptr, ptr %t1, align 8
  %calltmp10 = call i32 @str_equals(ptr %t9, ptr @.str.232)
  %eqtmp11 = icmp eq i32 %calltmp10, 1
  %ifcond12 = icmp ne i1 %eqtmp11, false
  br i1 %ifcond12, label %then13, label %ifcont14

then13:                                           ; preds = %ifcont8
  ret ptr @.str.233

ifcont14:                                         ; preds = %ifcont8
  %t15 = load ptr, ptr %t1, align 8
  %calltmp16 = call i32 @str_equals(ptr %t15, ptr @.str.234)
  %eqtmp17 = icmp eq i32 %calltmp16, 1
  %ifcond18 = icmp ne i1 %eqtmp17, false
  br i1 %ifcond18, label %then19, label %ifcont20

then19:                                           ; preds = %ifcont14
  ret ptr @.str.235

ifcont20:                                         ; preds = %ifcont14
  %t21 = load ptr, ptr %t1, align 8
  %calltmp22 = call i32 @str_equals(ptr %t21, ptr @.str.236)
  %eqtmp23 = icmp eq i32 %calltmp22, 1
  %ifcond24 = icmp ne i1 %eqtmp23, false
  br i1 %ifcond24, label %then25, label %ifcont26

then25:                                           ; preds = %ifcont20
  ret ptr @.str.237

ifcont26:                                         ; preds = %ifcont20
  ret ptr @.str.238
}

define ptr @struct_type_key(ptr %name) {
entry:
  %name1 = alloca ptr, align 8
  store ptr %name, ptr %name1, align 8
  %name2 = load ptr, ptr %name1, align 8
  %calltmp = call ptr @str_concat(ptr @.str.239, ptr %name2)
  ret ptr %calltmp
}

define i1 @is_struct_type_key(ptr %t) {
entry:
  %t1 = alloca ptr, align 8
  store ptr %t, ptr %t1, align 8
  %t2 = load ptr, ptr %t1, align 8
  %calltmp = call i32 @str_starts_with(ptr %t2, ptr @.str.240)
  %eqtmp = icmp eq i32 %calltmp, 1
  ret i1 %eqtmp
}

define ptr @struct_type_name(ptr %t) {
entry:
  %t1 = alloca ptr, align 8
  store ptr %t, ptr %t1, align 8
  %t2 = load ptr, ptr %t1, align 8
  %t3 = load ptr, ptr %t1, align 8
  %calltmp = call i32 @str_length(ptr %t3)
  %subtmp = sub i32 %calltmp, 7
  %calltmp4 = call ptr @str_substring(ptr %t2, i32 7, i32 %subtmp)
  ret ptr %calltmp4
}

define ptr @llvm_type_name(ptr %t) {
entry:
  %t1 = alloca ptr, align 8
  store ptr %t, ptr %t1, align 8
  %t2 = load ptr, ptr %t1, align 8
  %calltmp = call i1 @is_struct_type_key(ptr %t2)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %t3 = load ptr, ptr %t1, align 8
  %calltmp4 = call ptr @struct_type_name(ptr %t3)
  %calltmp5 = call ptr @str_concat(ptr @.str.241, ptr %calltmp4)
  ret ptr %calltmp5

ifcont:                                           ; preds = %entry
  %t6 = load ptr, ptr %t1, align 8
  ret ptr %t6
}

define ptr @map_type_node(ptr %tn) {
entry:
  %elem = alloca ptr, align 8
  %tn1 = alloca ptr, align 8
  store ptr %tn, ptr %tn1, align 8
  %structptr = load ptr, ptr %tn1, align 8
  %i1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 3
  %i1 = load i32, ptr %i1_ptr, align 4
  %eqtmp = icmp eq i32 %i1, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont17

then:                                             ; preds = %entry
  %structptr2 = load ptr, ptr %tn1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %child1, ptr @.str.242)
  %eqtmp3 = icmp eq i32 %calltmp, 0
  %ifcond4 = icmp ne i1 %eqtmp3, false
  br i1 %ifcond4, label %then5, label %ifcont16

then5:                                            ; preds = %then
  %structptr6 = load ptr, ptr %tn1, align 8
  %child1_ptr7 = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 5
  %child18 = load ptr, ptr %child1_ptr7, align 8
  %calltmp9 = call ptr @ptr_to_node(ptr %child18)
  store ptr %calltmp9, ptr %elem, align 8
  %structptr10 = load ptr, ptr %elem, align 8
  %i1_ptr11 = getelementptr inbounds %ASTNode, ptr %structptr10, i32 0, i32 3
  %i112 = load i32, ptr %i1_ptr11, align 4
  %eqtmp13 = icmp eq i32 %i112, 1
  %ifcond14 = icmp ne i1 %eqtmp13, false
  br i1 %ifcond14, label %then15, label %ifcont

then15:                                           ; preds = %then5
  ret ptr @.str.243

ifcont:                                           ; preds = %then5
  br label %ifcont16

ifcont16:                                         ; preds = %ifcont, %then
  ret ptr @.str.244

ifcont17:                                         ; preds = %entry
  %structptr18 = load ptr, ptr %tn1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr18, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %calltmp19 = call i32 @ir_is_struct_type_name(ptr %s1)
  %eqtmp20 = icmp eq i32 %calltmp19, 1
  %ifcond21 = icmp ne i1 %eqtmp20, false
  br i1 %ifcond21, label %then22, label %ifcont27

then22:                                           ; preds = %ifcont17
  %structptr23 = load ptr, ptr %tn1, align 8
  %s1_ptr24 = getelementptr inbounds %ASTNode, ptr %structptr23, i32 0, i32 1
  %s125 = load ptr, ptr %s1_ptr24, align 8
  %calltmp26 = call ptr @struct_type_key(ptr %s125)
  ret ptr %calltmp26

ifcont27:                                         ; preds = %ifcont17
  %structptr28 = load ptr, ptr %tn1, align 8
  %s1_ptr29 = getelementptr inbounds %ASTNode, ptr %structptr28, i32 0, i32 1
  %s130 = load ptr, ptr %s1_ptr29, align 8
  %calltmp31 = call ptr @map_type(ptr %s130)
  ret ptr %calltmp31
}

define ptr @storage_type(ptr %t) {
entry:
  %t1 = alloca ptr, align 8
  store ptr %t, ptr %t1, align 8
  %t2 = load ptr, ptr %t1, align 8
  %calltmp = call i32 @str_equals(ptr %t2, ptr @.str.245)
  %eqtmp = icmp eq i32 %calltmp, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret ptr @.str.246

ifcont:                                           ; preds = %entry
  %t3 = load ptr, ptr %t1, align 8
  %calltmp4 = call i1 @is_struct_type_key(ptr %t3)
  %ifcond5 = icmp ne i1 %calltmp4, false
  br i1 %ifcond5, label %then6, label %ifcont7

then6:                                            ; preds = %ifcont
  ret ptr @.str.247

ifcont7:                                          ; preds = %ifcont
  %t8 = load ptr, ptr %t1, align 8
  ret ptr %t8
}

define i32 @count_list_nodes(ptr %first_ptr) {
entry:
  %node = alloca ptr, align 8
  %curr = alloca ptr, align 8
  %count = alloca i32, align 4
  %first_ptr1 = alloca ptr, align 8
  store ptr %first_ptr, ptr %first_ptr1, align 8
  store i32 0, ptr %count, align 4
  %first_ptr2 = load ptr, ptr %first_ptr1, align 8
  store ptr %first_ptr2, ptr %curr, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %curr3 = load ptr, ptr %curr, align 8
  %calltmp = call i32 @str_equals(ptr %curr3, ptr @.str.248)
  %eqtmp = icmp eq i32 %calltmp, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %curr4 = load ptr, ptr %curr, align 8
  %calltmp5 = call ptr @ptr_to_node(ptr %curr4)
  store ptr %calltmp5, ptr %node, align 8
  %count6 = load i32, ptr %count, align 4
  %addtmp = add i32 %count6, 1
  store i32 %addtmp, ptr %count, align 4
  %structptr = load ptr, ptr %node, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %curr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %count7 = load i32, ptr %count, align 4
  ret i32 %count7
}

define ptr @fn_key(ptr %name) {
entry:
  %name1 = alloca ptr, align 8
  store ptr %name, ptr %name1, align 8
  %name2 = load ptr, ptr %name1, align 8
  %calltmp = call ptr @str_concat(ptr @.str.249, ptr %name2)
  ret ptr %calltmp
}

define ptr @get_declared_return_type(ptr %node, ptr %ret_child) {
entry:
  %ret_node = alloca ptr, align 8
  %ret_child2 = alloca ptr, align 8
  %node1 = alloca ptr, align 8
  store ptr %node, ptr %node1, align 8
  store ptr %ret_child, ptr %ret_child2, align 8
  %ret_child3 = load ptr, ptr %ret_child2, align 8
  %calltmp = call i32 @str_equals(ptr %ret_child3, ptr @.str.250)
  %eqtmp = icmp eq i32 %calltmp, 0
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %ret_child4 = load ptr, ptr %ret_child2, align 8
  %calltmp5 = call ptr @ptr_to_node(ptr %ret_child4)
  store ptr %calltmp5, ptr %ret_node, align 8
  %ret_node6 = load ptr, ptr %ret_node, align 8
  %calltmp7 = call ptr @map_type_node(ptr %ret_node6)
  ret ptr %calltmp7

ifcont:                                           ; preds = %entry
  ret ptr @.str.251
}

define ptr @get_expr_type(ptr %expr) {
entry:
  %object_type = alloca ptr, align 8
  %enum_val = alloca i32, align 4
  %object_node = alloca ptr, align 8
  %obj_type = alloca ptr, align 8
  %func_name = alloca ptr, align 8
  %callee = alloca ptr, align 8
  %op = alloca ptr, align 8
  %expr1 = alloca ptr, align 8
  store ptr %expr, ptr %expr1, align 8
  %structptr = load ptr, ptr %expr1, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp = icmp eq i32 %kind, 22
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont27

then:                                             ; preds = %entry
  %structptr2 = load ptr, ptr %expr1, align 8
  %i1_ptr = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 3
  %i1 = load i32, ptr %i1_ptr, align 4
  %eqtmp3 = icmp eq i32 %i1, 2
  %ifcond4 = icmp ne i1 %eqtmp3, false
  br i1 %ifcond4, label %then5, label %ifcont

then5:                                            ; preds = %then
  ret ptr @.str.252

ifcont:                                           ; preds = %then
  %structptr6 = load ptr, ptr %expr1, align 8
  %i1_ptr7 = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 3
  %i18 = load i32, ptr %i1_ptr7, align 4
  %eqtmp9 = icmp eq i32 %i18, 3
  %ifcond10 = icmp ne i1 %eqtmp9, false
  br i1 %ifcond10, label %then11, label %ifcont12

then11:                                           ; preds = %ifcont
  ret ptr @.str.253

ifcont12:                                         ; preds = %ifcont
  %structptr13 = load ptr, ptr %expr1, align 8
  %i1_ptr14 = getelementptr inbounds %ASTNode, ptr %structptr13, i32 0, i32 3
  %i115 = load i32, ptr %i1_ptr14, align 4
  %eqtmp16 = icmp eq i32 %i115, 1
  %ifcond17 = icmp ne i1 %eqtmp16, false
  br i1 %ifcond17, label %then18, label %ifcont19

then18:                                           ; preds = %ifcont12
  ret ptr @.str.254

ifcont19:                                         ; preds = %ifcont12
  %structptr20 = load ptr, ptr %expr1, align 8
  %i1_ptr21 = getelementptr inbounds %ASTNode, ptr %structptr20, i32 0, i32 3
  %i122 = load i32, ptr %i1_ptr21, align 4
  %eqtmp23 = icmp eq i32 %i122, 0
  %ifcond24 = icmp ne i1 %eqtmp23, false
  br i1 %ifcond24, label %then25, label %ifcont26

then25:                                           ; preds = %ifcont19
  ret ptr @.str.255

ifcont26:                                         ; preds = %ifcont19
  br label %ifcont27

ifcont27:                                         ; preds = %ifcont26, %entry
  %structptr28 = load ptr, ptr %expr1, align 8
  %kind_ptr29 = getelementptr inbounds %ASTNode, ptr %structptr28, i32 0, i32 0
  %kind30 = load i32, ptr %kind_ptr29, align 4
  %eqtmp31 = icmp eq i32 %kind30, 23
  %ifcond32 = icmp ne i1 %eqtmp31, false
  br i1 %ifcond32, label %then33, label %ifcont35

then33:                                           ; preds = %ifcont27
  %structptr34 = load ptr, ptr %expr1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr34, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %calltmp = call ptr @ir_get_var_type(ptr %s1)
  ret ptr %calltmp

ifcont35:                                         ; preds = %ifcont27
  %structptr36 = load ptr, ptr %expr1, align 8
  %kind_ptr37 = getelementptr inbounds %ASTNode, ptr %structptr36, i32 0, i32 0
  %kind38 = load i32, ptr %kind_ptr37, align 4
  %eqtmp39 = icmp eq i32 %kind38, 20
  %ifcond40 = icmp ne i1 %eqtmp39, false
  br i1 %ifcond40, label %then41, label %ifcont87

then41:                                           ; preds = %ifcont35
  %structptr42 = load ptr, ptr %expr1, align 8
  %s1_ptr43 = getelementptr inbounds %ASTNode, ptr %structptr42, i32 0, i32 1
  %s144 = load ptr, ptr %s1_ptr43, align 8
  store ptr %s144, ptr %op, align 8
  %op45 = load ptr, ptr %op, align 8
  %calltmp46 = call i32 @str_equals(ptr %op45, ptr @.str.256)
  %eqtmp47 = icmp eq i32 %calltmp46, 1
  %op48 = load ptr, ptr %op, align 8
  %calltmp49 = call i32 @str_equals(ptr %op48, ptr @.str.257)
  %eqtmp50 = icmp eq i32 %calltmp49, 1
  %ortmp = or i1 %eqtmp47, %eqtmp50
  %ifcond51 = icmp ne i1 %ortmp, false
  br i1 %ifcond51, label %then52, label %ifcont53

then52:                                           ; preds = %then41
  ret ptr @.str.258

ifcont53:                                         ; preds = %then41
  %op54 = load ptr, ptr %op, align 8
  %calltmp55 = call i32 @str_equals(ptr %op54, ptr @.str.259)
  %eqtmp56 = icmp eq i32 %calltmp55, 1
  %op57 = load ptr, ptr %op, align 8
  %calltmp58 = call i32 @str_equals(ptr %op57, ptr @.str.260)
  %eqtmp59 = icmp eq i32 %calltmp58, 1
  %ortmp60 = or i1 %eqtmp56, %eqtmp59
  %ifcond61 = icmp ne i1 %ortmp60, false
  br i1 %ifcond61, label %then62, label %ifcont63

then62:                                           ; preds = %ifcont53
  ret ptr @.str.261

ifcont63:                                         ; preds = %ifcont53
  %op64 = load ptr, ptr %op, align 8
  %calltmp65 = call i32 @str_equals(ptr %op64, ptr @.str.262)
  %eqtmp66 = icmp eq i32 %calltmp65, 1
  %op67 = load ptr, ptr %op, align 8
  %calltmp68 = call i32 @str_equals(ptr %op67, ptr @.str.263)
  %eqtmp69 = icmp eq i32 %calltmp68, 1
  %ortmp70 = or i1 %eqtmp66, %eqtmp69
  %ifcond71 = icmp ne i1 %ortmp70, false
  br i1 %ifcond71, label %then72, label %ifcont73

then72:                                           ; preds = %ifcont63
  ret ptr @.str.264

ifcont73:                                         ; preds = %ifcont63
  %op74 = load ptr, ptr %op, align 8
  %calltmp75 = call i32 @str_equals(ptr %op74, ptr @.str.265)
  %eqtmp76 = icmp eq i32 %calltmp75, 1
  %op77 = load ptr, ptr %op, align 8
  %calltmp78 = call i32 @str_equals(ptr %op77, ptr @.str.266)
  %eqtmp79 = icmp eq i32 %calltmp78, 1
  %ortmp80 = or i1 %eqtmp76, %eqtmp79
  %ifcond81 = icmp ne i1 %ortmp80, false
  br i1 %ifcond81, label %then82, label %ifcont83

then82:                                           ; preds = %ifcont73
  ret ptr @.str.267

ifcont83:                                         ; preds = %ifcont73
  %structptr84 = load ptr, ptr %expr1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr84, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp85 = call ptr @ptr_to_node(ptr %child1)
  %calltmp86 = call ptr @get_expr_type(ptr %calltmp85)
  ret ptr %calltmp86

ifcont87:                                         ; preds = %ifcont35
  %structptr88 = load ptr, ptr %expr1, align 8
  %kind_ptr89 = getelementptr inbounds %ASTNode, ptr %structptr88, i32 0, i32 0
  %kind90 = load i32, ptr %kind_ptr89, align 4
  %eqtmp91 = icmp eq i32 %kind90, 24
  %ifcond92 = icmp ne i1 %eqtmp91, false
  br i1 %ifcond92, label %then93, label %ifcont144

then93:                                           ; preds = %ifcont87
  %structptr94 = load ptr, ptr %expr1, align 8
  %child1_ptr95 = getelementptr inbounds %ASTNode, ptr %structptr94, i32 0, i32 5
  %child196 = load ptr, ptr %child1_ptr95, align 8
  %calltmp97 = call ptr @ptr_to_node(ptr %child196)
  store ptr %calltmp97, ptr %callee, align 8
  %structptr98 = load ptr, ptr %callee, align 8
  %s1_ptr99 = getelementptr inbounds %ASTNode, ptr %structptr98, i32 0, i32 1
  %s1100 = load ptr, ptr %s1_ptr99, align 8
  store ptr %s1100, ptr %func_name, align 8
  %func_name101 = load ptr, ptr %func_name, align 8
  %calltmp102 = call i32 @str_equals(ptr %func_name101, ptr @.str.268)
  %eqtmp103 = icmp eq i32 %calltmp102, 1
  %func_name104 = load ptr, ptr %func_name, align 8
  %calltmp105 = call i32 @str_equals(ptr %func_name104, ptr @.str.269)
  %eqtmp106 = icmp eq i32 %calltmp105, 1
  %ortmp107 = or i1 %eqtmp103, %eqtmp106
  %ifcond108 = icmp ne i1 %ortmp107, false
  br i1 %ifcond108, label %then109, label %ifcont110

then109:                                          ; preds = %then93
  ret ptr @.str.270

ifcont110:                                        ; preds = %then93
  %func_name111 = load ptr, ptr %func_name, align 8
  %calltmp112 = call i32 @str_equals(ptr %func_name111, ptr @.str.271)
  %eqtmp113 = icmp eq i32 %calltmp112, 1
  %func_name114 = load ptr, ptr %func_name, align 8
  %calltmp115 = call i32 @str_equals(ptr %func_name114, ptr @.str.272)
  %eqtmp116 = icmp eq i32 %calltmp115, 1
  %ortmp117 = or i1 %eqtmp113, %eqtmp116
  %ifcond118 = icmp ne i1 %ortmp117, false
  br i1 %ifcond118, label %then119, label %ifcont120

then119:                                          ; preds = %ifcont110
  ret ptr @.str.273

ifcont120:                                        ; preds = %ifcont110
  %func_name121 = load ptr, ptr %func_name, align 8
  %calltmp122 = call i32 @str_equals(ptr %func_name121, ptr @.str.274)
  %eqtmp123 = icmp eq i32 %calltmp122, 1
  %func_name124 = load ptr, ptr %func_name, align 8
  %calltmp125 = call i32 @str_equals(ptr %func_name124, ptr @.str.275)
  %eqtmp126 = icmp eq i32 %calltmp125, 1
  %ortmp127 = or i1 %eqtmp123, %eqtmp126
  %ifcond128 = icmp ne i1 %ortmp127, false
  br i1 %ifcond128, label %then129, label %ifcont130

then129:                                          ; preds = %ifcont120
  ret ptr @.str.276

ifcont130:                                        ; preds = %ifcont120
  %func_name131 = load ptr, ptr %func_name, align 8
  %calltmp132 = call i32 @str_equals(ptr %func_name131, ptr @.str.277)
  %eqtmp133 = icmp eq i32 %calltmp132, 1
  %func_name134 = load ptr, ptr %func_name, align 8
  %calltmp135 = call i32 @str_equals(ptr %func_name134, ptr @.str.278)
  %eqtmp136 = icmp eq i32 %calltmp135, 1
  %ortmp137 = or i1 %eqtmp133, %eqtmp136
  %ifcond138 = icmp ne i1 %ortmp137, false
  br i1 %ifcond138, label %then139, label %ifcont140

then139:                                          ; preds = %ifcont130
  ret ptr @.str.279

ifcont140:                                        ; preds = %ifcont130
  %func_name141 = load ptr, ptr %func_name, align 8
  %calltmp142 = call ptr @fn_key(ptr %func_name141)
  %calltmp143 = call ptr @ir_get_var_type(ptr %calltmp142)
  ret ptr %calltmp143

ifcont144:                                        ; preds = %ifcont87
  %structptr145 = load ptr, ptr %expr1, align 8
  %kind_ptr146 = getelementptr inbounds %ASTNode, ptr %structptr145, i32 0, i32 0
  %kind147 = load i32, ptr %kind_ptr146, align 4
  %eqtmp148 = icmp eq i32 %kind147, 26
  %ifcond149 = icmp ne i1 %eqtmp148, false
  br i1 %ifcond149, label %then150, label %ifcont162

then150:                                          ; preds = %ifcont144
  %structptr151 = load ptr, ptr %expr1, align 8
  %child1_ptr152 = getelementptr inbounds %ASTNode, ptr %structptr151, i32 0, i32 5
  %child1153 = load ptr, ptr %child1_ptr152, align 8
  %calltmp154 = call ptr @ptr_to_node(ptr %child1153)
  %calltmp155 = call ptr @get_expr_type(ptr %calltmp154)
  store ptr %calltmp155, ptr %obj_type, align 8
  %obj_type156 = load ptr, ptr %obj_type, align 8
  %calltmp157 = call i32 @str_equals(ptr %obj_type156, ptr @.str.280)
  %eqtmp158 = icmp eq i32 %calltmp157, 1
  %ifcond159 = icmp ne i1 %eqtmp158, false
  br i1 %ifcond159, label %then160, label %ifcont161

then160:                                          ; preds = %then150
  ret ptr @.str.281

ifcont161:                                        ; preds = %then150
  ret ptr @.str.282

ifcont162:                                        ; preds = %ifcont144
  %structptr163 = load ptr, ptr %expr1, align 8
  %kind_ptr164 = getelementptr inbounds %ASTNode, ptr %structptr163, i32 0, i32 0
  %kind165 = load i32, ptr %kind_ptr164, align 4
  %eqtmp166 = icmp eq i32 %kind165, 25
  %ifcond167 = icmp ne i1 %eqtmp166, false
  br i1 %ifcond167, label %then168, label %ifcont204

then168:                                          ; preds = %ifcont162
  %structptr169 = load ptr, ptr %expr1, align 8
  %child1_ptr170 = getelementptr inbounds %ASTNode, ptr %structptr169, i32 0, i32 5
  %child1171 = load ptr, ptr %child1_ptr170, align 8
  %calltmp172 = call ptr @ptr_to_node(ptr %child1171)
  store ptr %calltmp172, ptr %object_node, align 8
  %structptr173 = load ptr, ptr %object_node, align 8
  %kind_ptr174 = getelementptr inbounds %ASTNode, ptr %structptr173, i32 0, i32 0
  %kind175 = load i32, ptr %kind_ptr174, align 4
  %eqtmp176 = icmp eq i32 %kind175, 23
  %ifcond177 = icmp ne i1 %eqtmp176, false
  br i1 %ifcond177, label %then178, label %ifcont190

then178:                                          ; preds = %then168
  %structptr179 = load ptr, ptr %object_node, align 8
  %s1_ptr180 = getelementptr inbounds %ASTNode, ptr %structptr179, i32 0, i32 1
  %s1181 = load ptr, ptr %s1_ptr180, align 8
  %structptr182 = load ptr, ptr %expr1, align 8
  %s1_ptr183 = getelementptr inbounds %ASTNode, ptr %structptr182, i32 0, i32 1
  %s1184 = load ptr, ptr %s1_ptr183, align 8
  %calltmp185 = call i32 @ir_get_enum_variant(ptr %s1181, ptr %s1184)
  store i32 %calltmp185, ptr %enum_val, align 4
  %enum_val186 = load i32, ptr %enum_val, align 4
  %getmp = icmp sge i32 %enum_val186, 0
  %ifcond187 = icmp ne i1 %getmp, false
  br i1 %ifcond187, label %then188, label %ifcont189

then188:                                          ; preds = %then178
  ret ptr @.str.283

ifcont189:                                        ; preds = %then178
  br label %ifcont190

ifcont190:                                        ; preds = %ifcont189, %then168
  %object_node191 = load ptr, ptr %object_node, align 8
  %calltmp192 = call ptr @get_expr_type(ptr %object_node191)
  store ptr %calltmp192, ptr %object_type, align 8
  %object_type193 = load ptr, ptr %object_type, align 8
  %calltmp194 = call i1 @is_struct_type_key(ptr %object_type193)
  %ifcond195 = icmp ne i1 %calltmp194, false
  br i1 %ifcond195, label %then196, label %ifcont203

then196:                                          ; preds = %ifcont190
  %object_type197 = load ptr, ptr %object_type, align 8
  %calltmp198 = call ptr @struct_type_name(ptr %object_type197)
  %structptr199 = load ptr, ptr %expr1, align 8
  %s1_ptr200 = getelementptr inbounds %ASTNode, ptr %structptr199, i32 0, i32 1
  %s1201 = load ptr, ptr %s1_ptr200, align 8
  %calltmp202 = call ptr @ir_get_struct_field_type(ptr %calltmp198, ptr %s1201)
  ret ptr %calltmp202

ifcont203:                                        ; preds = %ifcont190
  ret ptr @.str.284

ifcont204:                                        ; preds = %ifcont162
  %structptr205 = load ptr, ptr %expr1, align 8
  %kind_ptr206 = getelementptr inbounds %ASTNode, ptr %structptr205, i32 0, i32 0
  %kind207 = load i32, ptr %kind_ptr206, align 4
  %eqtmp208 = icmp eq i32 %kind207, 27
  %ifcond209 = icmp ne i1 %eqtmp208, false
  br i1 %ifcond209, label %then210, label %ifcont211

then210:                                          ; preds = %ifcont204
  ret ptr @.str.285

ifcont211:                                        ; preds = %ifcont204
  %structptr212 = load ptr, ptr %expr1, align 8
  %kind_ptr213 = getelementptr inbounds %ASTNode, ptr %structptr212, i32 0, i32 0
  %kind214 = load i32, ptr %kind_ptr213, align 4
  %eqtmp215 = icmp eq i32 %kind214, 28
  %ifcond216 = icmp ne i1 %eqtmp215, false
  br i1 %ifcond216, label %then217, label %ifcont222

then217:                                          ; preds = %ifcont211
  %structptr218 = load ptr, ptr %expr1, align 8
  %s1_ptr219 = getelementptr inbounds %ASTNode, ptr %structptr218, i32 0, i32 1
  %s1220 = load ptr, ptr %s1_ptr219, align 8
  %calltmp221 = call ptr @struct_type_key(ptr %s1220)
  ret ptr %calltmp221

ifcont222:                                        ; preds = %ifcont211
  ret ptr @.str.286
}

define ptr @generate_expression(ptr %expr) {
entry:
  %temp_id639 = alloca i32, align 4
  %ret_type = alloca ptr, align 8
  %arg_val616 = alloca ptr, align 8
  %arg_node613 = alloca ptr, align 8
  %arg_ptr605 = alloca ptr, align 8
  %arg_type = alloca ptr, align 8
  %arg_val = alloca ptr, align 8
  %arg_node = alloca ptr, align 8
  %arg_ptr = alloca ptr, align 8
  %is_print = alloca i32, align 4
  %func_name = alloca ptr, align 8
  %callee = alloca ptr, align 8
  %op_type = alloca ptr, align 8
  %temp_id394 = alloca i32, align 4
  %op = alloca ptr, align 8
  %right_val = alloca ptr, align 8
  %left_val = alloca ptr, align 8
  %load_name369 = alloca ptr, align 8
  %load_temp366 = alloca i32, align 4
  %ptr_name = alloca ptr, align 8
  %ptr_temp = alloca i32, align 4
  %elem_type = alloca ptr, align 8
  %obj_type = alloca ptr, align 8
  %index_val = alloca ptr, align 8
  %array_val = alloca ptr, align 8
  %ret_name2 = alloca ptr, align 8
  %ret_temp2 = alloca i32, align 4
  %elem_slot_name = alloca ptr, align 8
  %elem_slot_temp = alloca i32, align 4
  %elem_val = alloca ptr, align 8
  %elem_node2 = alloca ptr, align 8
  %elem_index2 = alloca i32, align 4
  %elem_ptr2 = alloca ptr, align 8
  %arr_name2 = alloca ptr, align 8
  %arr_temp2 = alloca i32, align 4
  %ret_name = alloca ptr, align 8
  %ret_temp = alloca i32, align 4
  %slot_name = alloca ptr, align 8
  %slot_temp = alloca i32, align 4
  %inner_ptr = alloca ptr, align 8
  %elem_node = alloca ptr, align 8
  %elem_index = alloca i32, align 4
  %elem_ptr = alloca ptr, align 8
  %arr_name = alloca ptr, align 8
  %arr_temp = alloca i32, align 4
  %is_nested = alloca i32, align 4
  %first_elem = alloca ptr, align 8
  %elem_count = alloca i32, align 4
  %load_name = alloca ptr, align 8
  %load_temp = alloca i32, align 4
  %gep_name205 = alloca ptr, align 8
  %gep_temp202 = alloca i32, align 4
  %field_type200 = alloca ptr, align 8
  %field_index193 = alloca i32, align 4
  %struct_name187 = alloca ptr, align 8
  %object_type = alloca ptr, align 8
  %object_val = alloca ptr, align 8
  %enum_val = alloca i32, align 4
  %object_node = alloca ptr, align 8
  %temp_id146 = alloca i32, align 4
  %temp_id = alloca i32, align 4
  %load_type = alloca ptr, align 8
  %val_type = alloca ptr, align 8
  %gep_name = alloca ptr, align 8
  %gep_temp = alloca i32, align 4
  %field_index = alloca i32, align 4
  %field_type = alloca ptr, align 8
  %field_val = alloca ptr, align 8
  %field = alloca ptr, align 8
  %field_ptr = alloca ptr, align 8
  %mem_name = alloca ptr, align 8
  %mem_temp = alloca i32, align 4
  %size_name = alloca ptr, align 8
  %size_temp = alloca i32, align 4
  %size_ptr_name = alloca ptr, align 8
  %size_ptr_temp = alloca i32, align 4
  %struct_name = alloca ptr, align 8
  %tname = alloca ptr, align 8
  %temp = alloca i32, align 4
  %len_plus_one = alloca i32, align 4
  %str_len = alloca i32, align 4
  %str_name = alloca ptr, align 8
  %expr1 = alloca ptr, align 8
  store ptr %expr, ptr %expr1, align 8
  %structptr = load ptr, ptr %expr1, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp = icmp eq i32 %kind, 22
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont52

then:                                             ; preds = %entry
  %structptr2 = load ptr, ptr %expr1, align 8
  %i1_ptr = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 3
  %i1 = load i32, ptr %i1_ptr, align 4
  %eqtmp3 = icmp eq i32 %i1, 2
  %ifcond4 = icmp ne i1 %eqtmp3, false
  br i1 %ifcond4, label %then5, label %ifcont

then5:                                            ; preds = %then
  %structptr6 = load ptr, ptr %expr1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  ret ptr %s1

ifcont:                                           ; preds = %then
  %structptr7 = load ptr, ptr %expr1, align 8
  %i1_ptr8 = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 3
  %i19 = load i32, ptr %i1_ptr8, align 4
  %eqtmp10 = icmp eq i32 %i19, 3
  %ifcond11 = icmp ne i1 %eqtmp10, false
  br i1 %ifcond11, label %then12, label %ifcont20

then12:                                           ; preds = %ifcont
  %structptr13 = load ptr, ptr %expr1, align 8
  %s1_ptr14 = getelementptr inbounds %ASTNode, ptr %structptr13, i32 0, i32 1
  %s115 = load ptr, ptr %s1_ptr14, align 8
  %calltmp = call i32 @str_equals(ptr %s115, ptr @.str.287)
  %eqtmp16 = icmp eq i32 %calltmp, 1
  %ifcond17 = icmp ne i1 %eqtmp16, false
  br i1 %ifcond17, label %then18, label %ifcont19

then18:                                           ; preds = %then12
  ret ptr @.str.288

ifcont19:                                         ; preds = %then12
  ret ptr @.str.289

ifcont20:                                         ; preds = %ifcont
  %structptr21 = load ptr, ptr %expr1, align 8
  %i1_ptr22 = getelementptr inbounds %ASTNode, ptr %structptr21, i32 0, i32 3
  %i123 = load i32, ptr %i1_ptr22, align 4
  %eqtmp24 = icmp eq i32 %i123, 1
  %ifcond25 = icmp ne i1 %eqtmp24, false
  br i1 %ifcond25, label %then26, label %ifcont30

then26:                                           ; preds = %ifcont20
  %structptr27 = load ptr, ptr %expr1, align 8
  %s1_ptr28 = getelementptr inbounds %ASTNode, ptr %structptr27, i32 0, i32 1
  %s129 = load ptr, ptr %s1_ptr28, align 8
  ret ptr %s129

ifcont30:                                         ; preds = %ifcont20
  %structptr31 = load ptr, ptr %expr1, align 8
  %i1_ptr32 = getelementptr inbounds %ASTNode, ptr %structptr31, i32 0, i32 3
  %i133 = load i32, ptr %i1_ptr32, align 4
  %eqtmp34 = icmp eq i32 %i133, 0
  %ifcond35 = icmp ne i1 %eqtmp34, false
  br i1 %ifcond35, label %then36, label %ifcont51

then36:                                           ; preds = %ifcont30
  %structptr37 = load ptr, ptr %expr1, align 8
  %s2_ptr = getelementptr inbounds %ASTNode, ptr %structptr37, i32 0, i32 2
  %s2 = load ptr, ptr %s2_ptr, align 8
  store ptr %s2, ptr %str_name, align 8
  %structptr38 = load ptr, ptr %expr1, align 8
  %s1_ptr39 = getelementptr inbounds %ASTNode, ptr %structptr38, i32 0, i32 1
  %s140 = load ptr, ptr %s1_ptr39, align 8
  %calltmp41 = call i32 @str_length(ptr %s140)
  store i32 %calltmp41, ptr %str_len, align 4
  %str_len42 = load i32, ptr %str_len, align 4
  %addtmp = add i32 %str_len42, 1
  store i32 %addtmp, ptr %len_plus_one, align 4
  %calltmp43 = call i32 @ir_get_temp()
  store i32 %calltmp43, ptr %temp, align 4
  %temp44 = load i32, ptr %temp, align 4
  %calltmp45 = call ptr @ir_get_temp_name(i32 %temp44)
  store ptr %calltmp45, ptr %tname, align 8
  call void @ir_append(ptr @.str.290)
  %tname46 = load ptr, ptr %tname, align 8
  call void @ir_append(ptr %tname46)
  call void @ir_append(ptr @.str.291)
  %len_plus_one47 = load i32, ptr %len_plus_one, align 4
  %calltmp48 = call ptr @int_to_str(i32 %len_plus_one47)
  call void @ir_append(ptr %calltmp48)
  call void @ir_append(ptr @.str.292)
  %str_name49 = load ptr, ptr %str_name, align 8
  call void @ir_append(ptr %str_name49)
  call void @ir_append_line(ptr @.str.293)
  %tname50 = load ptr, ptr %tname, align 8
  ret ptr %tname50

ifcont51:                                         ; preds = %ifcont30
  br label %ifcont52

ifcont52:                                         ; preds = %ifcont51, %entry
  %structptr53 = load ptr, ptr %expr1, align 8
  %kind_ptr54 = getelementptr inbounds %ASTNode, ptr %structptr53, i32 0, i32 0
  %kind55 = load i32, ptr %kind_ptr54, align 4
  %eqtmp56 = icmp eq i32 %kind55, 28
  %ifcond57 = icmp ne i1 %eqtmp56, false
  br i1 %ifcond57, label %then58, label %ifcont114

then58:                                           ; preds = %ifcont52
  %structptr59 = load ptr, ptr %expr1, align 8
  %s1_ptr60 = getelementptr inbounds %ASTNode, ptr %structptr59, i32 0, i32 1
  %s161 = load ptr, ptr %s1_ptr60, align 8
  store ptr %s161, ptr %struct_name, align 8
  %calltmp62 = call i32 @ir_get_temp()
  store i32 %calltmp62, ptr %size_ptr_temp, align 4
  %size_ptr_temp63 = load i32, ptr %size_ptr_temp, align 4
  %calltmp64 = call ptr @ir_get_temp_name(i32 %size_ptr_temp63)
  store ptr %calltmp64, ptr %size_ptr_name, align 8
  call void @ir_append(ptr @.str.294)
  %size_ptr_name65 = load ptr, ptr %size_ptr_name, align 8
  call void @ir_append(ptr %size_ptr_name65)
  call void @ir_append(ptr @.str.295)
  %struct_name66 = load ptr, ptr %struct_name, align 8
  %calltmp67 = call ptr @str_concat(ptr @.str.296, ptr %struct_name66)
  call void @ir_append(ptr %calltmp67)
  call void @ir_append_line(ptr @.str.297)
  %calltmp68 = call i32 @ir_get_temp()
  store i32 %calltmp68, ptr %size_temp, align 4
  %size_temp69 = load i32, ptr %size_temp, align 4
  %calltmp70 = call ptr @ir_get_temp_name(i32 %size_temp69)
  store ptr %calltmp70, ptr %size_name, align 8
  call void @ir_append(ptr @.str.298)
  %size_name71 = load ptr, ptr %size_name, align 8
  call void @ir_append(ptr %size_name71)
  call void @ir_append(ptr @.str.299)
  %size_ptr_name72 = load ptr, ptr %size_ptr_name, align 8
  call void @ir_append(ptr %size_ptr_name72)
  call void @ir_append_line(ptr @.str.300)
  %calltmp73 = call i32 @ir_get_temp()
  store i32 %calltmp73, ptr %mem_temp, align 4
  %mem_temp74 = load i32, ptr %mem_temp, align 4
  %calltmp75 = call ptr @ir_get_temp_name(i32 %mem_temp74)
  store ptr %calltmp75, ptr %mem_name, align 8
  call void @ir_append(ptr @.str.301)
  %mem_name76 = load ptr, ptr %mem_name, align 8
  call void @ir_append(ptr %mem_name76)
  call void @ir_append(ptr @.str.302)
  %size_name77 = load ptr, ptr %size_name, align 8
  call void @ir_append(ptr %size_name77)
  call void @ir_append_line(ptr @.str.303)
  %structptr78 = load ptr, ptr %expr1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr78, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %field_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %then58
  %field_ptr79 = load ptr, ptr %field_ptr, align 8
  %calltmp80 = call i32 @str_equals(ptr %field_ptr79, ptr @.str.304)
  %eqtmp81 = icmp eq i32 %calltmp80, 0
  br i1 %eqtmp81, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %field_ptr82 = load ptr, ptr %field_ptr, align 8
  %calltmp83 = call ptr @ptr_to_node(ptr %field_ptr82)
  store ptr %calltmp83, ptr %field, align 8
  %structptr84 = load ptr, ptr %field, align 8
  %child1_ptr85 = getelementptr inbounds %ASTNode, ptr %structptr84, i32 0, i32 5
  %child186 = load ptr, ptr %child1_ptr85, align 8
  %calltmp87 = call ptr @ptr_to_node(ptr %child186)
  %calltmp88 = call ptr @generate_expression(ptr %calltmp87)
  store ptr %calltmp88, ptr %field_val, align 8
  %struct_name89 = load ptr, ptr %struct_name, align 8
  %structptr90 = load ptr, ptr %field, align 8
  %s1_ptr91 = getelementptr inbounds %ASTNode, ptr %structptr90, i32 0, i32 1
  %s192 = load ptr, ptr %s1_ptr91, align 8
  %calltmp93 = call ptr @ir_get_struct_field_type(ptr %struct_name89, ptr %s192)
  %calltmp94 = call ptr @storage_type(ptr %calltmp93)
  store ptr %calltmp94, ptr %field_type, align 8
  %struct_name95 = load ptr, ptr %struct_name, align 8
  %structptr96 = load ptr, ptr %field, align 8
  %s1_ptr97 = getelementptr inbounds %ASTNode, ptr %structptr96, i32 0, i32 1
  %s198 = load ptr, ptr %s1_ptr97, align 8
  %calltmp99 = call i32 @ir_get_struct_field_index(ptr %struct_name95, ptr %s198)
  store i32 %calltmp99, ptr %field_index, align 4
  %calltmp100 = call i32 @ir_get_temp()
  store i32 %calltmp100, ptr %gep_temp, align 4
  %gep_temp101 = load i32, ptr %gep_temp, align 4
  %calltmp102 = call ptr @ir_get_temp_name(i32 %gep_temp101)
  store ptr %calltmp102, ptr %gep_name, align 8
  call void @ir_append(ptr @.str.305)
  %gep_name103 = load ptr, ptr %gep_name, align 8
  call void @ir_append(ptr %gep_name103)
  call void @ir_append(ptr @.str.306)
  %struct_name104 = load ptr, ptr %struct_name, align 8
  %calltmp105 = call ptr @str_concat(ptr @.str.307, ptr %struct_name104)
  call void @ir_append(ptr %calltmp105)
  call void @ir_append(ptr @.str.308)
  %mem_name106 = load ptr, ptr %mem_name, align 8
  call void @ir_append(ptr %mem_name106)
  call void @ir_append(ptr @.str.309)
  %field_index107 = load i32, ptr %field_index, align 4
  %calltmp108 = call ptr @int_to_str(i32 %field_index107)
  call void @ir_append_line(ptr %calltmp108)
  call void @ir_append(ptr @.str.310)
  %field_type109 = load ptr, ptr %field_type, align 8
  call void @ir_append(ptr %field_type109)
  call void @ir_append(ptr @.str.311)
  %field_val110 = load ptr, ptr %field_val, align 8
  call void @ir_append(ptr %field_val110)
  call void @ir_append(ptr @.str.312)
  %gep_name111 = load ptr, ptr %gep_name, align 8
  call void @ir_append_line(ptr %gep_name111)
  %structptr112 = load ptr, ptr %field, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr112, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %field_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %mem_name113 = load ptr, ptr %mem_name, align 8
  ret ptr %mem_name113

ifcont114:                                        ; preds = %ifcont52
  %structptr115 = load ptr, ptr %expr1, align 8
  %kind_ptr116 = getelementptr inbounds %ASTNode, ptr %structptr115, i32 0, i32 0
  %kind117 = load i32, ptr %kind_ptr116, align 4
  %eqtmp118 = icmp eq i32 %kind117, 23
  %ifcond119 = icmp ne i1 %eqtmp118, false
  br i1 %ifcond119, label %then120, label %ifcont150

then120:                                          ; preds = %ifcont114
  %structptr121 = load ptr, ptr %expr1, align 8
  %s1_ptr122 = getelementptr inbounds %ASTNode, ptr %structptr121, i32 0, i32 1
  %s1123 = load ptr, ptr %s1_ptr122, align 8
  %calltmp124 = call ptr @ir_get_var_type(ptr %s1123)
  store ptr %calltmp124, ptr %val_type, align 8
  %val_type125 = load ptr, ptr %val_type, align 8
  %calltmp126 = call ptr @storage_type(ptr %val_type125)
  store ptr %calltmp126, ptr %load_type, align 8
  %structptr127 = load ptr, ptr %expr1, align 8
  %s1_ptr128 = getelementptr inbounds %ASTNode, ptr %structptr127, i32 0, i32 1
  %s1129 = load ptr, ptr %s1_ptr128, align 8
  %calltmp130 = call i32 @ir_is_global_name(ptr %s1129)
  %eqtmp131 = icmp eq i32 %calltmp130, 1
  %ifcond132 = icmp ne i1 %eqtmp131, false
  br i1 %ifcond132, label %then133, label %else

then133:                                          ; preds = %then120
  %load_type134 = load ptr, ptr %load_type, align 8
  %structptr135 = load ptr, ptr %expr1, align 8
  %s1_ptr136 = getelementptr inbounds %ASTNode, ptr %structptr135, i32 0, i32 1
  %s1137 = load ptr, ptr %s1_ptr136, align 8
  %calltmp138 = call i32 @ir_load_global(ptr %load_type134, ptr %s1137)
  store i32 %calltmp138, ptr %temp_id, align 4
  %temp_id139 = load i32, ptr %temp_id, align 4
  %calltmp140 = call ptr @ir_get_temp_name(i32 %temp_id139)
  ret ptr %calltmp140

else:                                             ; preds = %then120
  %load_type141 = load ptr, ptr %load_type, align 8
  %structptr142 = load ptr, ptr %expr1, align 8
  %s1_ptr143 = getelementptr inbounds %ASTNode, ptr %structptr142, i32 0, i32 1
  %s1144 = load ptr, ptr %s1_ptr143, align 8
  %calltmp145 = call i32 @ir_load(ptr %load_type141, ptr %s1144)
  store i32 %calltmp145, ptr %temp_id146, align 4
  %temp_id147 = load i32, ptr %temp_id146, align 4
  %calltmp148 = call ptr @ir_get_temp_name(i32 %temp_id147)
  ret ptr %calltmp148

ifcont149:                                        ; No predecessors!
  br label %ifcont150

ifcont150:                                        ; preds = %ifcont149, %ifcont114
  %structptr151 = load ptr, ptr %expr1, align 8
  %kind_ptr152 = getelementptr inbounds %ASTNode, ptr %structptr151, i32 0, i32 0
  %kind153 = load i32, ptr %kind_ptr152, align 4
  %eqtmp154 = icmp eq i32 %kind153, 25
  %ifcond155 = icmp ne i1 %eqtmp154, false
  br i1 %ifcond155, label %then156, label %ifcont219

then156:                                          ; preds = %ifcont150
  %structptr157 = load ptr, ptr %expr1, align 8
  %child1_ptr158 = getelementptr inbounds %ASTNode, ptr %structptr157, i32 0, i32 5
  %child1159 = load ptr, ptr %child1_ptr158, align 8
  %calltmp160 = call ptr @ptr_to_node(ptr %child1159)
  store ptr %calltmp160, ptr %object_node, align 8
  %structptr161 = load ptr, ptr %object_node, align 8
  %kind_ptr162 = getelementptr inbounds %ASTNode, ptr %structptr161, i32 0, i32 0
  %kind163 = load i32, ptr %kind_ptr162, align 4
  %eqtmp164 = icmp eq i32 %kind163, 23
  %ifcond165 = icmp ne i1 %eqtmp164, false
  br i1 %ifcond165, label %then166, label %ifcont180

then166:                                          ; preds = %then156
  %structptr167 = load ptr, ptr %object_node, align 8
  %s1_ptr168 = getelementptr inbounds %ASTNode, ptr %structptr167, i32 0, i32 1
  %s1169 = load ptr, ptr %s1_ptr168, align 8
  %structptr170 = load ptr, ptr %expr1, align 8
  %s1_ptr171 = getelementptr inbounds %ASTNode, ptr %structptr170, i32 0, i32 1
  %s1172 = load ptr, ptr %s1_ptr171, align 8
  %calltmp173 = call i32 @ir_get_enum_variant(ptr %s1169, ptr %s1172)
  store i32 %calltmp173, ptr %enum_val, align 4
  %enum_val174 = load i32, ptr %enum_val, align 4
  %getmp = icmp sge i32 %enum_val174, 0
  %ifcond175 = icmp ne i1 %getmp, false
  br i1 %ifcond175, label %then176, label %ifcont179

then176:                                          ; preds = %then166
  %enum_val177 = load i32, ptr %enum_val, align 4
  %calltmp178 = call ptr @int_to_str(i32 %enum_val177)
  ret ptr %calltmp178

ifcont179:                                        ; preds = %then166
  br label %ifcont180

ifcont180:                                        ; preds = %ifcont179, %then156
  %object_node181 = load ptr, ptr %object_node, align 8
  %calltmp182 = call ptr @generate_expression(ptr %object_node181)
  store ptr %calltmp182, ptr %object_val, align 8
  %object_node183 = load ptr, ptr %object_node, align 8
  %calltmp184 = call ptr @get_expr_type(ptr %object_node183)
  store ptr %calltmp184, ptr %object_type, align 8
  %object_type185 = load ptr, ptr %object_type, align 8
  %calltmp186 = call ptr @struct_type_name(ptr %object_type185)
  store ptr %calltmp186, ptr %struct_name187, align 8
  %struct_name188 = load ptr, ptr %struct_name187, align 8
  %structptr189 = load ptr, ptr %expr1, align 8
  %s1_ptr190 = getelementptr inbounds %ASTNode, ptr %structptr189, i32 0, i32 1
  %s1191 = load ptr, ptr %s1_ptr190, align 8
  %calltmp192 = call i32 @ir_get_struct_field_index(ptr %struct_name188, ptr %s1191)
  store i32 %calltmp192, ptr %field_index193, align 4
  %struct_name194 = load ptr, ptr %struct_name187, align 8
  %structptr195 = load ptr, ptr %expr1, align 8
  %s1_ptr196 = getelementptr inbounds %ASTNode, ptr %structptr195, i32 0, i32 1
  %s1197 = load ptr, ptr %s1_ptr196, align 8
  %calltmp198 = call ptr @ir_get_struct_field_type(ptr %struct_name194, ptr %s1197)
  %calltmp199 = call ptr @storage_type(ptr %calltmp198)
  store ptr %calltmp199, ptr %field_type200, align 8
  %calltmp201 = call i32 @ir_get_temp()
  store i32 %calltmp201, ptr %gep_temp202, align 4
  %gep_temp203 = load i32, ptr %gep_temp202, align 4
  %calltmp204 = call ptr @ir_get_temp_name(i32 %gep_temp203)
  store ptr %calltmp204, ptr %gep_name205, align 8
  call void @ir_append(ptr @.str.313)
  %gep_name206 = load ptr, ptr %gep_name205, align 8
  call void @ir_append(ptr %gep_name206)
  call void @ir_append(ptr @.str.314)
  %struct_name207 = load ptr, ptr %struct_name187, align 8
  %calltmp208 = call ptr @str_concat(ptr @.str.315, ptr %struct_name207)
  call void @ir_append(ptr %calltmp208)
  call void @ir_append(ptr @.str.316)
  %object_val209 = load ptr, ptr %object_val, align 8
  call void @ir_append(ptr %object_val209)
  call void @ir_append(ptr @.str.317)
  %field_index210 = load i32, ptr %field_index193, align 4
  %calltmp211 = call ptr @int_to_str(i32 %field_index210)
  call void @ir_append_line(ptr %calltmp211)
  %calltmp212 = call i32 @ir_get_temp()
  store i32 %calltmp212, ptr %load_temp, align 4
  %load_temp213 = load i32, ptr %load_temp, align 4
  %calltmp214 = call ptr @ir_get_temp_name(i32 %load_temp213)
  store ptr %calltmp214, ptr %load_name, align 8
  call void @ir_append(ptr @.str.318)
  %load_name215 = load ptr, ptr %load_name, align 8
  call void @ir_append(ptr %load_name215)
  call void @ir_append(ptr @.str.319)
  %field_type216 = load ptr, ptr %field_type200, align 8
  call void @ir_append(ptr %field_type216)
  call void @ir_append(ptr @.str.320)
  %gep_name217 = load ptr, ptr %gep_name205, align 8
  call void @ir_append_line(ptr %gep_name217)
  %load_name218 = load ptr, ptr %load_name, align 8
  ret ptr %load_name218

ifcont219:                                        ; preds = %ifcont150
  %structptr220 = load ptr, ptr %expr1, align 8
  %kind_ptr221 = getelementptr inbounds %ASTNode, ptr %structptr220, i32 0, i32 0
  %kind222 = load i32, ptr %kind_ptr221, align 4
  %eqtmp223 = icmp eq i32 %kind222, 27
  %ifcond224 = icmp ne i1 %eqtmp223, false
  br i1 %ifcond224, label %then225, label %ifcont332

then225:                                          ; preds = %ifcont219
  %structptr226 = load ptr, ptr %expr1, align 8
  %child1_ptr227 = getelementptr inbounds %ASTNode, ptr %structptr226, i32 0, i32 5
  %child1228 = load ptr, ptr %child1_ptr227, align 8
  %calltmp229 = call i32 @count_list_nodes(ptr %child1228)
  store i32 %calltmp229, ptr %elem_count, align 4
  %structptr230 = load ptr, ptr %expr1, align 8
  %child1_ptr231 = getelementptr inbounds %ASTNode, ptr %structptr230, i32 0, i32 5
  %child1232 = load ptr, ptr %child1_ptr231, align 8
  %calltmp233 = call ptr @ptr_to_node(ptr %child1232)
  store ptr %calltmp233, ptr %first_elem, align 8
  store i32 0, ptr %is_nested, align 4
  %structptr234 = load ptr, ptr %first_elem, align 8
  %kind_ptr235 = getelementptr inbounds %ASTNode, ptr %structptr234, i32 0, i32 0
  %kind236 = load i32, ptr %kind_ptr235, align 4
  %eqtmp237 = icmp eq i32 %kind236, 27
  %ifcond238 = icmp ne i1 %eqtmp237, false
  br i1 %ifcond238, label %then239, label %ifcont240

then239:                                          ; preds = %then225
  store i32 1, ptr %is_nested, align 4
  br label %ifcont240

ifcont240:                                        ; preds = %then239, %then225
  %is_nested241 = load i32, ptr %is_nested, align 4
  %eqtmp242 = icmp eq i32 %is_nested241, 1
  %ifcond243 = icmp ne i1 %eqtmp242, false
  br i1 %ifcond243, label %then244, label %ifcont288

then244:                                          ; preds = %ifcont240
  %calltmp245 = call i32 @ir_get_temp()
  store i32 %calltmp245, ptr %arr_temp, align 4
  %arr_temp246 = load i32, ptr %arr_temp, align 4
  %calltmp247 = call ptr @ir_get_temp_name(i32 %arr_temp246)
  store ptr %calltmp247, ptr %arr_name, align 8
  call void @ir_append(ptr @.str.321)
  %arr_name248 = load ptr, ptr %arr_name, align 8
  call void @ir_append(ptr %arr_name248)
  call void @ir_append(ptr @.str.322)
  %elem_count249 = load i32, ptr %elem_count, align 4
  %calltmp250 = call ptr @int_to_str(i32 %elem_count249)
  call void @ir_append(ptr %calltmp250)
  call void @ir_append_line(ptr @.str.323)
  %structptr251 = load ptr, ptr %expr1, align 8
  %child1_ptr252 = getelementptr inbounds %ASTNode, ptr %structptr251, i32 0, i32 5
  %child1253 = load ptr, ptr %child1_ptr252, align 8
  store ptr %child1253, ptr %elem_ptr, align 8
  store i32 0, ptr %elem_index, align 4
  br label %whilecond254

whilecond254:                                     ; preds = %whilebody258, %then244
  %elem_ptr255 = load ptr, ptr %elem_ptr, align 8
  %calltmp256 = call i32 @str_equals(ptr %elem_ptr255, ptr @.str.324)
  %eqtmp257 = icmp eq i32 %calltmp256, 0
  br i1 %eqtmp257, label %whilebody258, label %afterwhile279

whilebody258:                                     ; preds = %whilecond254
  %elem_ptr259 = load ptr, ptr %elem_ptr, align 8
  %calltmp260 = call ptr @ptr_to_node(ptr %elem_ptr259)
  store ptr %calltmp260, ptr %elem_node, align 8
  %elem_node261 = load ptr, ptr %elem_node, align 8
  %calltmp262 = call ptr @generate_expression(ptr %elem_node261)
  store ptr %calltmp262, ptr %inner_ptr, align 8
  %calltmp263 = call i32 @ir_get_temp()
  store i32 %calltmp263, ptr %slot_temp, align 4
  %slot_temp264 = load i32, ptr %slot_temp, align 4
  %calltmp265 = call ptr @ir_get_temp_name(i32 %slot_temp264)
  store ptr %calltmp265, ptr %slot_name, align 8
  call void @ir_append(ptr @.str.325)
  %slot_name266 = load ptr, ptr %slot_name, align 8
  call void @ir_append(ptr %slot_name266)
  call void @ir_append(ptr @.str.326)
  %elem_count267 = load i32, ptr %elem_count, align 4
  %calltmp268 = call ptr @int_to_str(i32 %elem_count267)
  call void @ir_append(ptr %calltmp268)
  call void @ir_append(ptr @.str.327)
  %arr_name269 = load ptr, ptr %arr_name, align 8
  call void @ir_append(ptr %arr_name269)
  call void @ir_append(ptr @.str.328)
  %elem_index270 = load i32, ptr %elem_index, align 4
  %calltmp271 = call ptr @int_to_str(i32 %elem_index270)
  call void @ir_append_line(ptr %calltmp271)
  call void @ir_append(ptr @.str.329)
  %inner_ptr272 = load ptr, ptr %inner_ptr, align 8
  call void @ir_append(ptr %inner_ptr272)
  call void @ir_append(ptr @.str.330)
  %slot_name273 = load ptr, ptr %slot_name, align 8
  call void @ir_append_line(ptr %slot_name273)
  %elem_index274 = load i32, ptr %elem_index, align 4
  %addtmp275 = add i32 %elem_index274, 1
  store i32 %addtmp275, ptr %elem_index, align 4
  %structptr276 = load ptr, ptr %elem_node, align 8
  %next_ptr277 = getelementptr inbounds %ASTNode, ptr %structptr276, i32 0, i32 8
  %next278 = load ptr, ptr %next_ptr277, align 8
  store ptr %next278, ptr %elem_ptr, align 8
  br label %whilecond254

afterwhile279:                                    ; preds = %whilecond254
  %calltmp280 = call i32 @ir_get_temp()
  store i32 %calltmp280, ptr %ret_temp, align 4
  %ret_temp281 = load i32, ptr %ret_temp, align 4
  %calltmp282 = call ptr @ir_get_temp_name(i32 %ret_temp281)
  store ptr %calltmp282, ptr %ret_name, align 8
  call void @ir_append(ptr @.str.331)
  %ret_name283 = load ptr, ptr %ret_name, align 8
  call void @ir_append(ptr %ret_name283)
  call void @ir_append(ptr @.str.332)
  %elem_count284 = load i32, ptr %elem_count, align 4
  %calltmp285 = call ptr @int_to_str(i32 %elem_count284)
  call void @ir_append(ptr %calltmp285)
  call void @ir_append(ptr @.str.333)
  %arr_name286 = load ptr, ptr %arr_name, align 8
  call void @ir_append(ptr %arr_name286)
  call void @ir_append_line(ptr @.str.334)
  %ret_name287 = load ptr, ptr %ret_name, align 8
  ret ptr %ret_name287

ifcont288:                                        ; preds = %ifcont240
  %calltmp289 = call i32 @ir_get_temp()
  store i32 %calltmp289, ptr %arr_temp2, align 4
  %arr_temp2290 = load i32, ptr %arr_temp2, align 4
  %calltmp291 = call ptr @ir_get_temp_name(i32 %arr_temp2290)
  store ptr %calltmp291, ptr %arr_name2, align 8
  call void @ir_append(ptr @.str.335)
  %arr_name2292 = load ptr, ptr %arr_name2, align 8
  call void @ir_append(ptr %arr_name2292)
  call void @ir_append(ptr @.str.336)
  %elem_count293 = load i32, ptr %elem_count, align 4
  %calltmp294 = call ptr @int_to_str(i32 %elem_count293)
  call void @ir_append(ptr %calltmp294)
  call void @ir_append_line(ptr @.str.337)
  %structptr295 = load ptr, ptr %expr1, align 8
  %child1_ptr296 = getelementptr inbounds %ASTNode, ptr %structptr295, i32 0, i32 5
  %child1297 = load ptr, ptr %child1_ptr296, align 8
  store ptr %child1297, ptr %elem_ptr2, align 8
  store i32 0, ptr %elem_index2, align 4
  br label %whilecond298

whilecond298:                                     ; preds = %whilebody302, %ifcont288
  %elem_ptr2299 = load ptr, ptr %elem_ptr2, align 8
  %calltmp300 = call i32 @str_equals(ptr %elem_ptr2299, ptr @.str.338)
  %eqtmp301 = icmp eq i32 %calltmp300, 0
  br i1 %eqtmp301, label %whilebody302, label %afterwhile323

whilebody302:                                     ; preds = %whilecond298
  %elem_ptr2303 = load ptr, ptr %elem_ptr2, align 8
  %calltmp304 = call ptr @ptr_to_node(ptr %elem_ptr2303)
  store ptr %calltmp304, ptr %elem_node2, align 8
  %elem_node2305 = load ptr, ptr %elem_node2, align 8
  %calltmp306 = call ptr @generate_expression(ptr %elem_node2305)
  store ptr %calltmp306, ptr %elem_val, align 8
  %calltmp307 = call i32 @ir_get_temp()
  store i32 %calltmp307, ptr %elem_slot_temp, align 4
  %elem_slot_temp308 = load i32, ptr %elem_slot_temp, align 4
  %calltmp309 = call ptr @ir_get_temp_name(i32 %elem_slot_temp308)
  store ptr %calltmp309, ptr %elem_slot_name, align 8
  call void @ir_append(ptr @.str.339)
  %elem_slot_name310 = load ptr, ptr %elem_slot_name, align 8
  call void @ir_append(ptr %elem_slot_name310)
  call void @ir_append(ptr @.str.340)
  %elem_count311 = load i32, ptr %elem_count, align 4
  %calltmp312 = call ptr @int_to_str(i32 %elem_count311)
  call void @ir_append(ptr %calltmp312)
  call void @ir_append(ptr @.str.341)
  %arr_name2313 = load ptr, ptr %arr_name2, align 8
  call void @ir_append(ptr %arr_name2313)
  call void @ir_append(ptr @.str.342)
  %elem_index2314 = load i32, ptr %elem_index2, align 4
  %calltmp315 = call ptr @int_to_str(i32 %elem_index2314)
  call void @ir_append_line(ptr %calltmp315)
  call void @ir_append(ptr @.str.343)
  %elem_val316 = load ptr, ptr %elem_val, align 8
  call void @ir_append(ptr %elem_val316)
  call void @ir_append(ptr @.str.344)
  %elem_slot_name317 = load ptr, ptr %elem_slot_name, align 8
  call void @ir_append_line(ptr %elem_slot_name317)
  %elem_index2318 = load i32, ptr %elem_index2, align 4
  %addtmp319 = add i32 %elem_index2318, 1
  store i32 %addtmp319, ptr %elem_index2, align 4
  %structptr320 = load ptr, ptr %elem_node2, align 8
  %next_ptr321 = getelementptr inbounds %ASTNode, ptr %structptr320, i32 0, i32 8
  %next322 = load ptr, ptr %next_ptr321, align 8
  store ptr %next322, ptr %elem_ptr2, align 8
  br label %whilecond298

afterwhile323:                                    ; preds = %whilecond298
  %calltmp324 = call i32 @ir_get_temp()
  store i32 %calltmp324, ptr %ret_temp2, align 4
  %ret_temp2325 = load i32, ptr %ret_temp2, align 4
  %calltmp326 = call ptr @ir_get_temp_name(i32 %ret_temp2325)
  store ptr %calltmp326, ptr %ret_name2, align 8
  call void @ir_append(ptr @.str.345)
  %ret_name2327 = load ptr, ptr %ret_name2, align 8
  call void @ir_append(ptr %ret_name2327)
  call void @ir_append(ptr @.str.346)
  %elem_count328 = load i32, ptr %elem_count, align 4
  %calltmp329 = call ptr @int_to_str(i32 %elem_count328)
  call void @ir_append(ptr %calltmp329)
  call void @ir_append(ptr @.str.347)
  %arr_name2330 = load ptr, ptr %arr_name2, align 8
  call void @ir_append(ptr %arr_name2330)
  call void @ir_append_line(ptr @.str.348)
  %ret_name2331 = load ptr, ptr %ret_name2, align 8
  ret ptr %ret_name2331

ifcont332:                                        ; preds = %ifcont219
  %structptr333 = load ptr, ptr %expr1, align 8
  %kind_ptr334 = getelementptr inbounds %ASTNode, ptr %structptr333, i32 0, i32 0
  %kind335 = load i32, ptr %kind_ptr334, align 4
  %eqtmp336 = icmp eq i32 %kind335, 26
  %ifcond337 = icmp ne i1 %eqtmp336, false
  br i1 %ifcond337, label %then338, label %ifcont374

then338:                                          ; preds = %ifcont332
  %structptr339 = load ptr, ptr %expr1, align 8
  %child1_ptr340 = getelementptr inbounds %ASTNode, ptr %structptr339, i32 0, i32 5
  %child1341 = load ptr, ptr %child1_ptr340, align 8
  %calltmp342 = call ptr @ptr_to_node(ptr %child1341)
  %calltmp343 = call ptr @generate_expression(ptr %calltmp342)
  store ptr %calltmp343, ptr %array_val, align 8
  %structptr344 = load ptr, ptr %expr1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr344, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp345 = call ptr @ptr_to_node(ptr %child2)
  %calltmp346 = call ptr @generate_expression(ptr %calltmp345)
  store ptr %calltmp346, ptr %index_val, align 8
  %structptr347 = load ptr, ptr %expr1, align 8
  %child1_ptr348 = getelementptr inbounds %ASTNode, ptr %structptr347, i32 0, i32 5
  %child1349 = load ptr, ptr %child1_ptr348, align 8
  %calltmp350 = call ptr @ptr_to_node(ptr %child1349)
  %calltmp351 = call ptr @get_expr_type(ptr %calltmp350)
  store ptr %calltmp351, ptr %obj_type, align 8
  store ptr @.str.349, ptr %elem_type, align 8
  %obj_type352 = load ptr, ptr %obj_type, align 8
  %calltmp353 = call i32 @str_equals(ptr %obj_type352, ptr @.str.350)
  %eqtmp354 = icmp eq i32 %calltmp353, 1
  %ifcond355 = icmp ne i1 %eqtmp354, false
  br i1 %ifcond355, label %then356, label %ifcont357

then356:                                          ; preds = %then338
  store ptr @.str.351, ptr %elem_type, align 8
  br label %ifcont357

ifcont357:                                        ; preds = %then356, %then338
  %calltmp358 = call i32 @ir_get_temp()
  store i32 %calltmp358, ptr %ptr_temp, align 4
  %ptr_temp359 = load i32, ptr %ptr_temp, align 4
  %calltmp360 = call ptr @ir_get_temp_name(i32 %ptr_temp359)
  store ptr %calltmp360, ptr %ptr_name, align 8
  call void @ir_append(ptr @.str.352)
  %ptr_name361 = load ptr, ptr %ptr_name, align 8
  call void @ir_append(ptr %ptr_name361)
  call void @ir_append(ptr @.str.353)
  %elem_type362 = load ptr, ptr %elem_type, align 8
  call void @ir_append(ptr %elem_type362)
  call void @ir_append(ptr @.str.354)
  %array_val363 = load ptr, ptr %array_val, align 8
  call void @ir_append(ptr %array_val363)
  call void @ir_append(ptr @.str.355)
  %index_val364 = load ptr, ptr %index_val, align 8
  call void @ir_append_line(ptr %index_val364)
  %calltmp365 = call i32 @ir_get_temp()
  store i32 %calltmp365, ptr %load_temp366, align 4
  %load_temp367 = load i32, ptr %load_temp366, align 4
  %calltmp368 = call ptr @ir_get_temp_name(i32 %load_temp367)
  store ptr %calltmp368, ptr %load_name369, align 8
  call void @ir_append(ptr @.str.356)
  %load_name370 = load ptr, ptr %load_name369, align 8
  call void @ir_append(ptr %load_name370)
  call void @ir_append(ptr @.str.357)
  %elem_type371 = load ptr, ptr %elem_type, align 8
  call void @ir_append(ptr %elem_type371)
  call void @ir_append(ptr @.str.358)
  %ptr_name372 = load ptr, ptr %ptr_name, align 8
  call void @ir_append_line(ptr %ptr_name372)
  %load_name373 = load ptr, ptr %load_name369, align 8
  ret ptr %load_name373

ifcont374:                                        ; preds = %ifcont332
  %structptr375 = load ptr, ptr %expr1, align 8
  %kind_ptr376 = getelementptr inbounds %ASTNode, ptr %structptr375, i32 0, i32 0
  %kind377 = load i32, ptr %kind_ptr376, align 4
  %eqtmp378 = icmp eq i32 %kind377, 20
  %ifcond379 = icmp ne i1 %eqtmp378, false
  br i1 %ifcond379, label %then380, label %ifcont530

then380:                                          ; preds = %ifcont374
  %structptr381 = load ptr, ptr %expr1, align 8
  %child1_ptr382 = getelementptr inbounds %ASTNode, ptr %structptr381, i32 0, i32 5
  %child1383 = load ptr, ptr %child1_ptr382, align 8
  %calltmp384 = call ptr @ptr_to_node(ptr %child1383)
  %calltmp385 = call ptr @generate_expression(ptr %calltmp384)
  store ptr %calltmp385, ptr %left_val, align 8
  %structptr386 = load ptr, ptr %expr1, align 8
  %child2_ptr387 = getelementptr inbounds %ASTNode, ptr %structptr386, i32 0, i32 6
  %child2388 = load ptr, ptr %child2_ptr387, align 8
  %calltmp389 = call ptr @ptr_to_node(ptr %child2388)
  %calltmp390 = call ptr @generate_expression(ptr %calltmp389)
  store ptr %calltmp390, ptr %right_val, align 8
  %structptr391 = load ptr, ptr %expr1, align 8
  %s1_ptr392 = getelementptr inbounds %ASTNode, ptr %structptr391, i32 0, i32 1
  %s1393 = load ptr, ptr %s1_ptr392, align 8
  store ptr %s1393, ptr %op, align 8
  store i32 0, ptr %temp_id394, align 4
  %structptr395 = load ptr, ptr %expr1, align 8
  %child1_ptr396 = getelementptr inbounds %ASTNode, ptr %structptr395, i32 0, i32 5
  %child1397 = load ptr, ptr %child1_ptr396, align 8
  %calltmp398 = call ptr @ptr_to_node(ptr %child1397)
  %calltmp399 = call ptr @get_expr_type(ptr %calltmp398)
  store ptr %calltmp399, ptr %op_type, align 8
  %op400 = load ptr, ptr %op, align 8
  %calltmp401 = call i32 @str_equals(ptr %op400, ptr @.str.359)
  %eqtmp402 = icmp eq i32 %calltmp401, 1
  %ifcond403 = icmp ne i1 %eqtmp402, false
  br i1 %ifcond403, label %then404, label %ifcont409

then404:                                          ; preds = %then380
  %op_type405 = load ptr, ptr %op_type, align 8
  %left_val406 = load ptr, ptr %left_val, align 8
  %right_val407 = load ptr, ptr %right_val, align 8
  %calltmp408 = call i32 @ir_add(ptr %op_type405, ptr %left_val406, ptr %right_val407)
  store i32 %calltmp408, ptr %temp_id394, align 4
  br label %ifcont409

ifcont409:                                        ; preds = %then404, %then380
  %op410 = load ptr, ptr %op, align 8
  %calltmp411 = call i32 @str_equals(ptr %op410, ptr @.str.360)
  %eqtmp412 = icmp eq i32 %calltmp411, 1
  %ifcond413 = icmp ne i1 %eqtmp412, false
  br i1 %ifcond413, label %then414, label %ifcont419

then414:                                          ; preds = %ifcont409
  %op_type415 = load ptr, ptr %op_type, align 8
  %left_val416 = load ptr, ptr %left_val, align 8
  %right_val417 = load ptr, ptr %right_val, align 8
  %calltmp418 = call i32 @ir_sub(ptr %op_type415, ptr %left_val416, ptr %right_val417)
  store i32 %calltmp418, ptr %temp_id394, align 4
  br label %ifcont419

ifcont419:                                        ; preds = %then414, %ifcont409
  %op420 = load ptr, ptr %op, align 8
  %calltmp421 = call i32 @str_equals(ptr %op420, ptr @.str.361)
  %eqtmp422 = icmp eq i32 %calltmp421, 1
  %ifcond423 = icmp ne i1 %eqtmp422, false
  br i1 %ifcond423, label %then424, label %ifcont429

then424:                                          ; preds = %ifcont419
  %op_type425 = load ptr, ptr %op_type, align 8
  %left_val426 = load ptr, ptr %left_val, align 8
  %right_val427 = load ptr, ptr %right_val, align 8
  %calltmp428 = call i32 @ir_mul(ptr %op_type425, ptr %left_val426, ptr %right_val427)
  store i32 %calltmp428, ptr %temp_id394, align 4
  br label %ifcont429

ifcont429:                                        ; preds = %then424, %ifcont419
  %op430 = load ptr, ptr %op, align 8
  %calltmp431 = call i32 @str_equals(ptr %op430, ptr @.str.362)
  %eqtmp432 = icmp eq i32 %calltmp431, 1
  %ifcond433 = icmp ne i1 %eqtmp432, false
  br i1 %ifcond433, label %then434, label %ifcont439

then434:                                          ; preds = %ifcont429
  %op_type435 = load ptr, ptr %op_type, align 8
  %left_val436 = load ptr, ptr %left_val, align 8
  %right_val437 = load ptr, ptr %right_val, align 8
  %calltmp438 = call i32 @ir_sdiv(ptr %op_type435, ptr %left_val436, ptr %right_val437)
  store i32 %calltmp438, ptr %temp_id394, align 4
  br label %ifcont439

ifcont439:                                        ; preds = %then434, %ifcont429
  %op440 = load ptr, ptr %op, align 8
  %calltmp441 = call i32 @str_equals(ptr %op440, ptr @.str.363)
  %eqtmp442 = icmp eq i32 %calltmp441, 1
  %ifcond443 = icmp ne i1 %eqtmp442, false
  br i1 %ifcond443, label %then444, label %ifcont449

then444:                                          ; preds = %ifcont439
  %op_type445 = load ptr, ptr %op_type, align 8
  %left_val446 = load ptr, ptr %left_val, align 8
  %right_val447 = load ptr, ptr %right_val, align 8
  %calltmp448 = call i32 @ir_srem(ptr %op_type445, ptr %left_val446, ptr %right_val447)
  store i32 %calltmp448, ptr %temp_id394, align 4
  br label %ifcont449

ifcont449:                                        ; preds = %then444, %ifcont439
  %op450 = load ptr, ptr %op, align 8
  %calltmp451 = call i32 @str_equals(ptr %op450, ptr @.str.364)
  %eqtmp452 = icmp eq i32 %calltmp451, 1
  %ifcond453 = icmp ne i1 %eqtmp452, false
  br i1 %ifcond453, label %then454, label %ifcont459

then454:                                          ; preds = %ifcont449
  %op_type455 = load ptr, ptr %op_type, align 8
  %left_val456 = load ptr, ptr %left_val, align 8
  %right_val457 = load ptr, ptr %right_val, align 8
  %calltmp458 = call i32 @ir_icmp_eq(ptr %op_type455, ptr %left_val456, ptr %right_val457)
  store i32 %calltmp458, ptr %temp_id394, align 4
  br label %ifcont459

ifcont459:                                        ; preds = %then454, %ifcont449
  %op460 = load ptr, ptr %op, align 8
  %calltmp461 = call i32 @str_equals(ptr %op460, ptr @.str.365)
  %eqtmp462 = icmp eq i32 %calltmp461, 1
  %ifcond463 = icmp ne i1 %eqtmp462, false
  br i1 %ifcond463, label %then464, label %ifcont469

then464:                                          ; preds = %ifcont459
  %op_type465 = load ptr, ptr %op_type, align 8
  %left_val466 = load ptr, ptr %left_val, align 8
  %right_val467 = load ptr, ptr %right_val, align 8
  %calltmp468 = call i32 @ir_icmp_ne(ptr %op_type465, ptr %left_val466, ptr %right_val467)
  store i32 %calltmp468, ptr %temp_id394, align 4
  br label %ifcont469

ifcont469:                                        ; preds = %then464, %ifcont459
  %op470 = load ptr, ptr %op, align 8
  %calltmp471 = call i32 @str_equals(ptr %op470, ptr @.str.366)
  %eqtmp472 = icmp eq i32 %calltmp471, 1
  %ifcond473 = icmp ne i1 %eqtmp472, false
  br i1 %ifcond473, label %then474, label %ifcont479

then474:                                          ; preds = %ifcont469
  %op_type475 = load ptr, ptr %op_type, align 8
  %left_val476 = load ptr, ptr %left_val, align 8
  %right_val477 = load ptr, ptr %right_val, align 8
  %calltmp478 = call i32 @ir_icmp_slt(ptr %op_type475, ptr %left_val476, ptr %right_val477)
  store i32 %calltmp478, ptr %temp_id394, align 4
  br label %ifcont479

ifcont479:                                        ; preds = %then474, %ifcont469
  %op480 = load ptr, ptr %op, align 8
  %calltmp481 = call i32 @str_equals(ptr %op480, ptr @.str.367)
  %eqtmp482 = icmp eq i32 %calltmp481, 1
  %ifcond483 = icmp ne i1 %eqtmp482, false
  br i1 %ifcond483, label %then484, label %ifcont489

then484:                                          ; preds = %ifcont479
  %op_type485 = load ptr, ptr %op_type, align 8
  %left_val486 = load ptr, ptr %left_val, align 8
  %right_val487 = load ptr, ptr %right_val, align 8
  %calltmp488 = call i32 @ir_icmp_sle(ptr %op_type485, ptr %left_val486, ptr %right_val487)
  store i32 %calltmp488, ptr %temp_id394, align 4
  br label %ifcont489

ifcont489:                                        ; preds = %then484, %ifcont479
  %op490 = load ptr, ptr %op, align 8
  %calltmp491 = call i32 @str_equals(ptr %op490, ptr @.str.368)
  %eqtmp492 = icmp eq i32 %calltmp491, 1
  %ifcond493 = icmp ne i1 %eqtmp492, false
  br i1 %ifcond493, label %then494, label %ifcont499

then494:                                          ; preds = %ifcont489
  %op_type495 = load ptr, ptr %op_type, align 8
  %left_val496 = load ptr, ptr %left_val, align 8
  %right_val497 = load ptr, ptr %right_val, align 8
  %calltmp498 = call i32 @ir_icmp_sgt(ptr %op_type495, ptr %left_val496, ptr %right_val497)
  store i32 %calltmp498, ptr %temp_id394, align 4
  br label %ifcont499

ifcont499:                                        ; preds = %then494, %ifcont489
  %op500 = load ptr, ptr %op, align 8
  %calltmp501 = call i32 @str_equals(ptr %op500, ptr @.str.369)
  %eqtmp502 = icmp eq i32 %calltmp501, 1
  %ifcond503 = icmp ne i1 %eqtmp502, false
  br i1 %ifcond503, label %then504, label %ifcont509

then504:                                          ; preds = %ifcont499
  %op_type505 = load ptr, ptr %op_type, align 8
  %left_val506 = load ptr, ptr %left_val, align 8
  %right_val507 = load ptr, ptr %right_val, align 8
  %calltmp508 = call i32 @ir_icmp_sge(ptr %op_type505, ptr %left_val506, ptr %right_val507)
  store i32 %calltmp508, ptr %temp_id394, align 4
  br label %ifcont509

ifcont509:                                        ; preds = %then504, %ifcont499
  %op510 = load ptr, ptr %op, align 8
  %calltmp511 = call i32 @str_equals(ptr %op510, ptr @.str.370)
  %eqtmp512 = icmp eq i32 %calltmp511, 1
  %ifcond513 = icmp ne i1 %eqtmp512, false
  br i1 %ifcond513, label %then514, label %ifcont518

then514:                                          ; preds = %ifcont509
  %left_val515 = load ptr, ptr %left_val, align 8
  %right_val516 = load ptr, ptr %right_val, align 8
  %calltmp517 = call i32 @ir_and(ptr @.str.371, ptr %left_val515, ptr %right_val516)
  store i32 %calltmp517, ptr %temp_id394, align 4
  br label %ifcont518

ifcont518:                                        ; preds = %then514, %ifcont509
  %op519 = load ptr, ptr %op, align 8
  %calltmp520 = call i32 @str_equals(ptr %op519, ptr @.str.372)
  %eqtmp521 = icmp eq i32 %calltmp520, 1
  %ifcond522 = icmp ne i1 %eqtmp521, false
  br i1 %ifcond522, label %then523, label %ifcont527

then523:                                          ; preds = %ifcont518
  %left_val524 = load ptr, ptr %left_val, align 8
  %right_val525 = load ptr, ptr %right_val, align 8
  %calltmp526 = call i32 @ir_or(ptr @.str.373, ptr %left_val524, ptr %right_val525)
  store i32 %calltmp526, ptr %temp_id394, align 4
  br label %ifcont527

ifcont527:                                        ; preds = %then523, %ifcont518
  %temp_id528 = load i32, ptr %temp_id394, align 4
  %calltmp529 = call ptr @ir_get_temp_name(i32 %temp_id528)
  ret ptr %calltmp529

ifcont530:                                        ; preds = %ifcont374
  %structptr531 = load ptr, ptr %expr1, align 8
  %kind_ptr532 = getelementptr inbounds %ASTNode, ptr %structptr531, i32 0, i32 0
  %kind533 = load i32, ptr %kind_ptr532, align 4
  %eqtmp534 = icmp eq i32 %kind533, 24
  %ifcond535 = icmp ne i1 %eqtmp534, false
  br i1 %ifcond535, label %then536, label %ifcont642

then536:                                          ; preds = %ifcont530
  %structptr537 = load ptr, ptr %expr1, align 8
  %child1_ptr538 = getelementptr inbounds %ASTNode, ptr %structptr537, i32 0, i32 5
  %child1539 = load ptr, ptr %child1_ptr538, align 8
  %calltmp540 = call ptr @ptr_to_node(ptr %child1539)
  store ptr %calltmp540, ptr %callee, align 8
  %structptr541 = load ptr, ptr %callee, align 8
  %s1_ptr542 = getelementptr inbounds %ASTNode, ptr %structptr541, i32 0, i32 1
  %s1543 = load ptr, ptr %s1_ptr542, align 8
  store ptr %s1543, ptr %func_name, align 8
  store i32 0, ptr %is_print, align 4
  %func_name544 = load ptr, ptr %func_name, align 8
  %calltmp545 = call i32 @str_equals(ptr %func_name544, ptr @.str.374)
  %eqtmp546 = icmp eq i32 %calltmp545, 1
  %ifcond547 = icmp ne i1 %eqtmp546, false
  br i1 %ifcond547, label %then548, label %ifcont549

then548:                                          ; preds = %then536
  store i32 1, ptr %is_print, align 4
  br label %ifcont549

ifcont549:                                        ; preds = %then548, %then536
  %func_name550 = load ptr, ptr %func_name, align 8
  %calltmp551 = call i32 @str_equals(ptr %func_name550, ptr @.str.375)
  %eqtmp552 = icmp eq i32 %calltmp551, 1
  %ifcond553 = icmp ne i1 %eqtmp552, false
  br i1 %ifcond553, label %then554, label %ifcont555

then554:                                          ; preds = %ifcont549
  store i32 2, ptr %is_print, align 4
  br label %ifcont555

ifcont555:                                        ; preds = %then554, %ifcont549
  %is_print556 = load i32, ptr %is_print, align 4
  %gttmp = icmp sgt i32 %is_print556, 0
  %ifcond557 = icmp ne i1 %gttmp, false
  br i1 %ifcond557, label %then558, label %ifcont601

then558:                                          ; preds = %ifcont555
  %structptr559 = load ptr, ptr %expr1, align 8
  %child2_ptr560 = getelementptr inbounds %ASTNode, ptr %structptr559, i32 0, i32 6
  %child2561 = load ptr, ptr %child2_ptr560, align 8
  store ptr %child2561, ptr %arg_ptr, align 8
  %arg_ptr562 = load ptr, ptr %arg_ptr, align 8
  %calltmp563 = call i32 @str_equals(ptr %arg_ptr562, ptr @.str.376)
  %eqtmp564 = icmp eq i32 %calltmp563, 0
  %ifcond565 = icmp ne i1 %eqtmp564, false
  br i1 %ifcond565, label %then566, label %ifcont600

then566:                                          ; preds = %then558
  %arg_ptr567 = load ptr, ptr %arg_ptr, align 8
  %calltmp568 = call ptr @ptr_to_node(ptr %arg_ptr567)
  store ptr %calltmp568, ptr %arg_node, align 8
  %arg_node569 = load ptr, ptr %arg_node, align 8
  %calltmp570 = call ptr @generate_expression(ptr %arg_node569)
  store ptr %calltmp570, ptr %arg_val, align 8
  %arg_node571 = load ptr, ptr %arg_node, align 8
  %calltmp572 = call ptr @get_expr_type(ptr %arg_node571)
  store ptr %calltmp572, ptr %arg_type, align 8
  call void @ir_call_begin()
  %arg_type573 = load ptr, ptr %arg_type, align 8
  %calltmp574 = call i32 @str_equals(ptr %arg_type573, ptr @.str.377)
  %eqtmp575 = icmp eq i32 %calltmp574, 1
  %ifcond576 = icmp ne i1 %eqtmp575, false
  br i1 %ifcond576, label %then577, label %else587

then577:                                          ; preds = %then566
  %arg_val578 = load ptr, ptr %arg_val, align 8
  call void @ir_call_arg(ptr @.str.378, ptr %arg_val578)
  %is_print579 = load i32, ptr %is_print, align 4
  %eqtmp580 = icmp eq i32 %is_print579, 1
  %ifcond581 = icmp ne i1 %eqtmp580, false
  br i1 %ifcond581, label %then582, label %else584

then582:                                          ; preds = %then577
  %calltmp583 = call i32 @ir_call_end(ptr @.str.379, ptr @.str.380)
  br label %ifcont586

else584:                                          ; preds = %then577
  %calltmp585 = call i32 @ir_call_end(ptr @.str.381, ptr @.str.382)
  br label %ifcont586

ifcont586:                                        ; preds = %else584, %then582
  br label %ifcont599

else587:                                          ; preds = %then566
  %arg_type588 = load ptr, ptr %arg_type, align 8
  %calltmp589 = call ptr @storage_type(ptr %arg_type588)
  %arg_val590 = load ptr, ptr %arg_val, align 8
  call void @ir_call_arg(ptr %calltmp589, ptr %arg_val590)
  %is_print591 = load i32, ptr %is_print, align 4
  %eqtmp592 = icmp eq i32 %is_print591, 1
  %ifcond593 = icmp ne i1 %eqtmp592, false
  br i1 %ifcond593, label %then594, label %else596

then594:                                          ; preds = %else587
  %calltmp595 = call i32 @ir_call_end(ptr @.str.383, ptr @.str.384)
  br label %ifcont598

else596:                                          ; preds = %else587
  %calltmp597 = call i32 @ir_call_end(ptr @.str.385, ptr @.str.386)
  br label %ifcont598

ifcont598:                                        ; preds = %else596, %then594
  br label %ifcont599

ifcont599:                                        ; preds = %ifcont598, %ifcont586
  br label %ifcont600

ifcont600:                                        ; preds = %ifcont599, %then558
  ret ptr @.str.387

ifcont601:                                        ; preds = %ifcont555
  call void @ir_call_begin()
  %structptr602 = load ptr, ptr %expr1, align 8
  %child2_ptr603 = getelementptr inbounds %ASTNode, ptr %structptr602, i32 0, i32 6
  %child2604 = load ptr, ptr %child2_ptr603, align 8
  store ptr %child2604, ptr %arg_ptr605, align 8
  br label %whilecond606

whilecond606:                                     ; preds = %whilebody610, %ifcont601
  %arg_ptr607 = load ptr, ptr %arg_ptr605, align 8
  %calltmp608 = call i32 @str_equals(ptr %arg_ptr607, ptr @.str.388)
  %eqtmp609 = icmp eq i32 %calltmp608, 0
  br i1 %eqtmp609, label %whilebody610, label %afterwhile624

whilebody610:                                     ; preds = %whilecond606
  %arg_ptr611 = load ptr, ptr %arg_ptr605, align 8
  %calltmp612 = call ptr @ptr_to_node(ptr %arg_ptr611)
  store ptr %calltmp612, ptr %arg_node613, align 8
  %arg_node614 = load ptr, ptr %arg_node613, align 8
  %calltmp615 = call ptr @generate_expression(ptr %arg_node614)
  store ptr %calltmp615, ptr %arg_val616, align 8
  %arg_node617 = load ptr, ptr %arg_node613, align 8
  %calltmp618 = call ptr @get_expr_type(ptr %arg_node617)
  %calltmp619 = call ptr @storage_type(ptr %calltmp618)
  %arg_val620 = load ptr, ptr %arg_val616, align 8
  call void @ir_call_arg(ptr %calltmp619, ptr %arg_val620)
  %structptr621 = load ptr, ptr %arg_node613, align 8
  %next_ptr622 = getelementptr inbounds %ASTNode, ptr %structptr621, i32 0, i32 8
  %next623 = load ptr, ptr %next_ptr622, align 8
  store ptr %next623, ptr %arg_ptr605, align 8
  br label %whilecond606

afterwhile624:                                    ; preds = %whilecond606
  %expr625 = load ptr, ptr %expr1, align 8
  %calltmp626 = call ptr @get_expr_type(ptr %expr625)
  %calltmp627 = call ptr @storage_type(ptr %calltmp626)
  store ptr %calltmp627, ptr %ret_type, align 8
  %ret_type628 = load ptr, ptr %ret_type, align 8
  %calltmp629 = call i32 @str_equals(ptr %ret_type628, ptr @.str.389)
  %eqtmp630 = icmp eq i32 %calltmp629, 1
  %ifcond631 = icmp ne i1 %eqtmp630, false
  br i1 %ifcond631, label %then632, label %ifcont635

then632:                                          ; preds = %afterwhile624
  %func_name633 = load ptr, ptr %func_name, align 8
  %calltmp634 = call i32 @ir_call_end(ptr @.str.390, ptr %func_name633)
  ret ptr @.str.391

ifcont635:                                        ; preds = %afterwhile624
  %ret_type636 = load ptr, ptr %ret_type, align 8
  %func_name637 = load ptr, ptr %func_name, align 8
  %calltmp638 = call i32 @ir_call_end(ptr %ret_type636, ptr %func_name637)
  store i32 %calltmp638, ptr %temp_id639, align 4
  %temp_id640 = load i32, ptr %temp_id639, align 4
  %calltmp641 = call ptr @ir_get_temp_name(i32 %temp_id640)
  ret ptr %calltmp641

ifcont642:                                        ; preds = %ifcont530
  ret ptr @.str.392
}

define ptr @get_variable_decl_type(ptr %stmt) {
entry:
  %type_node = alloca ptr, align 8
  %var_type = alloca ptr, align 8
  %stmt1 = alloca ptr, align 8
  store ptr %stmt, ptr %stmt1, align 8
  store ptr @.str.410, ptr %var_type, align 8
  %structptr = load ptr, ptr %stmt1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %child1, ptr @.str.411)
  %eqtmp = icmp eq i32 %calltmp, 0
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %entry
  %structptr2 = load ptr, ptr %stmt1, align 8
  %child1_ptr3 = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 5
  %child14 = load ptr, ptr %child1_ptr3, align 8
  %calltmp5 = call ptr @ptr_to_node(ptr %child14)
  store ptr %calltmp5, ptr %type_node, align 8
  %type_node6 = load ptr, ptr %type_node, align 8
  %calltmp7 = call ptr @map_type_node(ptr %type_node6)
  store ptr %calltmp7, ptr %var_type, align 8
  br label %ifcont18

else:                                             ; preds = %entry
  %structptr8 = load ptr, ptr %stmt1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr8, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp9 = call i32 @str_equals(ptr %child2, ptr @.str.412)
  %eqtmp10 = icmp eq i32 %calltmp9, 0
  %ifcond11 = icmp ne i1 %eqtmp10, false
  br i1 %ifcond11, label %then12, label %ifcont

then12:                                           ; preds = %else
  %structptr13 = load ptr, ptr %stmt1, align 8
  %child2_ptr14 = getelementptr inbounds %ASTNode, ptr %structptr13, i32 0, i32 6
  %child215 = load ptr, ptr %child2_ptr14, align 8
  %calltmp16 = call ptr @ptr_to_node(ptr %child215)
  %calltmp17 = call ptr @get_expr_type(ptr %calltmp16)
  store ptr %calltmp17, ptr %var_type, align 8
  br label %ifcont

ifcont:                                           ; preds = %then12, %else
  br label %ifcont18

ifcont18:                                         ; preds = %ifcont, %then
  %var_type19 = load ptr, ptr %var_type, align 8
  ret ptr %var_type19
}

define void @predeclare_locals_stmt(ptr %stmt) {
entry:
  %else_node = alloca ptr, align 8
  %var_type = alloca ptr, align 8
  %stmt1 = alloca ptr, align 8
  store ptr %stmt, ptr %stmt1, align 8
  %structptr = load ptr, ptr %stmt1, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp = icmp eq i32 %kind, 3
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %stmt2 = load ptr, ptr %stmt1, align 8
  %calltmp = call ptr @get_variable_decl_type(ptr %stmt2)
  store ptr %calltmp, ptr %var_type, align 8
  %structptr3 = load ptr, ptr %stmt1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr3, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %var_type4 = load ptr, ptr %var_type, align 8
  call void @ir_set_var_type(ptr %s1, ptr %var_type4)
  %var_type5 = load ptr, ptr %var_type, align 8
  %calltmp6 = call ptr @storage_type(ptr %var_type5)
  %structptr7 = load ptr, ptr %stmt1, align 8
  %s1_ptr8 = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 1
  %s19 = load ptr, ptr %s1_ptr8, align 8
  %calltmp10 = call i32 @ir_alloca(ptr %calltmp6, ptr %s19)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %structptr11 = load ptr, ptr %stmt1, align 8
  %kind_ptr12 = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 0
  %kind13 = load i32, ptr %kind_ptr12, align 4
  %eqtmp14 = icmp eq i32 %kind13, 10
  %ifcond15 = icmp ne i1 %eqtmp14, false
  br i1 %ifcond15, label %then16, label %ifcont41

then16:                                           ; preds = %ifcont
  %structptr17 = load ptr, ptr %stmt1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr17, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp18 = call i32 @str_equals(ptr %child2, ptr @.str.413)
  %eqtmp19 = icmp eq i32 %calltmp18, 0
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %then16
  br label %ifcont22

ifcont22:                                         ; preds = %then21, %then16
  %structptr23 = load ptr, ptr %stmt1, align 8
  %child3_ptr = getelementptr inbounds %ASTNode, ptr %structptr23, i32 0, i32 7
  %child3 = load ptr, ptr %child3_ptr, align 8
  %calltmp24 = call i32 @str_equals(ptr %child3, ptr @.str.414)
  %eqtmp25 = icmp eq i32 %calltmp24, 0
  %ifcond26 = icmp ne i1 %eqtmp25, false
  br i1 %ifcond26, label %then27, label %ifcont40

then27:                                           ; preds = %ifcont22
  %structptr28 = load ptr, ptr %stmt1, align 8
  %child3_ptr29 = getelementptr inbounds %ASTNode, ptr %structptr28, i32 0, i32 7
  %child330 = load ptr, ptr %child3_ptr29, align 8
  %calltmp31 = call ptr @ptr_to_node(ptr %child330)
  store ptr %calltmp31, ptr %else_node, align 8
  %structptr32 = load ptr, ptr %else_node, align 8
  %kind_ptr33 = getelementptr inbounds %ASTNode, ptr %structptr32, i32 0, i32 0
  %kind34 = load i32, ptr %kind_ptr33, align 4
  %eqtmp35 = icmp eq i32 %kind34, 9
  %ifcond36 = icmp ne i1 %eqtmp35, false
  br i1 %ifcond36, label %then37, label %else

then37:                                           ; preds = %then27
  br label %ifcont39

else:                                             ; preds = %then27
  %else_node38 = load ptr, ptr %else_node, align 8
  call void @predeclare_locals_stmt(ptr %else_node38)
  br label %ifcont39

ifcont39:                                         ; preds = %else, %then37
  br label %ifcont40

ifcont40:                                         ; preds = %ifcont39, %ifcont22
  br label %ifcont41

ifcont41:                                         ; preds = %ifcont40, %ifcont
  %structptr42 = load ptr, ptr %stmt1, align 8
  %kind_ptr43 = getelementptr inbounds %ASTNode, ptr %structptr42, i32 0, i32 0
  %kind44 = load i32, ptr %kind_ptr43, align 4
  %eqtmp45 = icmp eq i32 %kind44, 13
  %ifcond46 = icmp ne i1 %eqtmp45, false
  br i1 %ifcond46, label %then47, label %ifcont56

then47:                                           ; preds = %ifcont41
  %structptr48 = load ptr, ptr %stmt1, align 8
  %child2_ptr49 = getelementptr inbounds %ASTNode, ptr %structptr48, i32 0, i32 6
  %child250 = load ptr, ptr %child2_ptr49, align 8
  %calltmp51 = call i32 @str_equals(ptr %child250, ptr @.str.415)
  %eqtmp52 = icmp eq i32 %calltmp51, 0
  %ifcond53 = icmp ne i1 %eqtmp52, false
  br i1 %ifcond53, label %then54, label %ifcont55

then54:                                           ; preds = %then47
  br label %ifcont55

ifcont55:                                         ; preds = %then54, %then47
  br label %ifcont56

ifcont56:                                         ; preds = %ifcont55, %ifcont41
  %structptr57 = load ptr, ptr %stmt1, align 8
  %kind_ptr58 = getelementptr inbounds %ASTNode, ptr %structptr57, i32 0, i32 0
  %kind59 = load i32, ptr %kind_ptr58, align 4
  %eqtmp60 = icmp eq i32 %kind59, 14
  %ifcond61 = icmp ne i1 %eqtmp60, false
  br i1 %ifcond61, label %then62, label %ifcont69

then62:                                           ; preds = %ifcont56
  %structptr63 = load ptr, ptr %stmt1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr63, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp64 = call i32 @str_equals(ptr %child1, ptr @.str.416)
  %eqtmp65 = icmp eq i32 %calltmp64, 0
  %ifcond66 = icmp ne i1 %eqtmp65, false
  br i1 %ifcond66, label %then67, label %ifcont68

then67:                                           ; preds = %then62
  br label %ifcont68

ifcont68:                                         ; preds = %then67, %then62
  br label %ifcont69

ifcont69:                                         ; preds = %ifcont68, %ifcont56
  ret void
}

define void @predeclare_locals_block(ptr %block) {
entry:
  %stmt = alloca ptr, align 8
  %stmt_ptr = alloca ptr, align 8
  %block1 = alloca ptr, align 8
  store ptr %block, ptr %block1, align 8
  %structptr = load ptr, ptr %block1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %stmt_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %stmt_ptr2 = load ptr, ptr %stmt_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %stmt_ptr2, ptr @.str.417)
  %eqtmp = icmp eq i32 %calltmp, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %stmt_ptr3 = load ptr, ptr %stmt_ptr, align 8
  %calltmp4 = call ptr @ptr_to_node(ptr %stmt_ptr3)
  store ptr %calltmp4, ptr %stmt, align 8
  %stmt5 = load ptr, ptr %stmt, align 8
  call void @predeclare_locals_stmt(ptr %stmt5)
  %structptr6 = load ptr, ptr %stmt, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %stmt_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret void
}

define void @generate_function(ptr %func) {
entry:
  %p_store_type = alloca ptr, align 8
  %p_type_str = alloca ptr, align 8
  %p_type_node52 = alloca ptr, align 8
  %param_node47 = alloca ptr, align 8
  %param_ptr2 = alloca ptr, align 8
  %p_type_node = alloca ptr, align 8
  %param_node = alloca ptr, align 8
  %param_ptr = alloca ptr, align 8
  %ret_sig_type = alloca ptr, align 8
  %is_main = alloca i32, align 4
  %ret_node = alloca ptr, align 8
  %ret_type = alloca ptr, align 8
  %func_name = alloca ptr, align 8
  %func1 = alloca ptr, align 8
  store ptr %func, ptr %func1, align 8
  %structptr = load ptr, ptr %func1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  store ptr %s1, ptr %func_name, align 8
  store ptr @.str.418, ptr %ret_type, align 8
  %structptr2 = load ptr, ptr %func1, align 8
  %child3_ptr = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 7
  %child3 = load ptr, ptr %child3_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %child3, ptr @.str.419)
  %eqtmp = icmp eq i32 %calltmp, 0
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structptr3 = load ptr, ptr %func1, align 8
  %child3_ptr4 = getelementptr inbounds %ASTNode, ptr %structptr3, i32 0, i32 7
  %child35 = load ptr, ptr %child3_ptr4, align 8
  %calltmp6 = call ptr @ptr_to_node(ptr %child35)
  store ptr %calltmp6, ptr %ret_node, align 8
  %ret_node7 = load ptr, ptr %ret_node, align 8
  %calltmp8 = call ptr @map_type_node(ptr %ret_node7)
  store ptr %calltmp8, ptr %ret_type, align 8
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  store i32 0, ptr %is_main, align 4
  %func_name9 = load ptr, ptr %func_name, align 8
  %calltmp10 = call i32 @str_equals(ptr %func_name9, ptr @.str.420)
  %eqtmp11 = icmp eq i32 %calltmp10, 1
  %ifcond12 = icmp ne i1 %eqtmp11, false
  br i1 %ifcond12, label %then13, label %ifcont14

then13:                                           ; preds = %ifcont
  store ptr @.str.421, ptr %ret_type, align 8
  store i32 1, ptr %is_main, align 4
  br label %ifcont14

ifcont14:                                         ; preds = %then13, %ifcont
  %ret_type15 = load ptr, ptr %ret_type, align 8
  %calltmp16 = call ptr @storage_type(ptr %ret_type15)
  store ptr %calltmp16, ptr %ret_sig_type, align 8
  %func_name17 = load ptr, ptr %func_name, align 8
  %ret_sig_type18 = load ptr, ptr %ret_sig_type, align 8
  call void @ir_function_begin(ptr %func_name17, ptr %ret_sig_type18)
  %structptr19 = load ptr, ptr %func1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr19, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %param_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %ifcont14
  %param_ptr20 = load ptr, ptr %param_ptr, align 8
  %calltmp21 = call i32 @str_equals(ptr %param_ptr20, ptr @.str.422)
  %eqtmp22 = icmp eq i32 %calltmp21, 0
  br i1 %eqtmp22, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %param_ptr23 = load ptr, ptr %param_ptr, align 8
  %calltmp24 = call ptr @ptr_to_node(ptr %param_ptr23)
  store ptr %calltmp24, ptr %param_node, align 8
  %structptr25 = load ptr, ptr %param_node, align 8
  %child1_ptr26 = getelementptr inbounds %ASTNode, ptr %structptr25, i32 0, i32 5
  %child127 = load ptr, ptr %child1_ptr26, align 8
  %calltmp28 = call ptr @ptr_to_node(ptr %child127)
  store ptr %calltmp28, ptr %p_type_node, align 8
  %p_type_node29 = load ptr, ptr %p_type_node, align 8
  %calltmp30 = call ptr @map_type_node(ptr %p_type_node29)
  %calltmp31 = call ptr @storage_type(ptr %calltmp30)
  %structptr32 = load ptr, ptr %param_node, align 8
  %s1_ptr33 = getelementptr inbounds %ASTNode, ptr %structptr32, i32 0, i32 1
  %s134 = load ptr, ptr %s1_ptr33, align 8
  %calltmp35 = call ptr @str_concat(ptr @.str.423, ptr %s134)
  call void @ir_function_param(ptr %calltmp31, ptr %calltmp35)
  %structptr36 = load ptr, ptr %param_node, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr36, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %param_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  call void @ir_function_body_start()
  call void @ir_clear_local_var_types()
  call void @ir_clear_returned()
  %structptr37 = load ptr, ptr %func1, align 8
  %child1_ptr38 = getelementptr inbounds %ASTNode, ptr %structptr37, i32 0, i32 5
  %child139 = load ptr, ptr %child1_ptr38, align 8
  store ptr %child139, ptr %param_ptr2, align 8
  br label %whilecond40

whilecond40:                                      ; preds = %whilebody44, %afterwhile
  %param_ptr241 = load ptr, ptr %param_ptr2, align 8
  %calltmp42 = call i32 @str_equals(ptr %param_ptr241, ptr @.str.424)
  %eqtmp43 = icmp eq i32 %calltmp42, 0
  br i1 %eqtmp43, label %whilebody44, label %afterwhile77

whilebody44:                                      ; preds = %whilecond40
  %param_ptr245 = load ptr, ptr %param_ptr2, align 8
  %calltmp46 = call ptr @ptr_to_node(ptr %param_ptr245)
  store ptr %calltmp46, ptr %param_node47, align 8
  %structptr48 = load ptr, ptr %param_node47, align 8
  %child1_ptr49 = getelementptr inbounds %ASTNode, ptr %structptr48, i32 0, i32 5
  %child150 = load ptr, ptr %child1_ptr49, align 8
  %calltmp51 = call ptr @ptr_to_node(ptr %child150)
  store ptr %calltmp51, ptr %p_type_node52, align 8
  %p_type_node53 = load ptr, ptr %p_type_node52, align 8
  %calltmp54 = call ptr @map_type_node(ptr %p_type_node53)
  store ptr %calltmp54, ptr %p_type_str, align 8
  %p_type_str55 = load ptr, ptr %p_type_str, align 8
  %calltmp56 = call ptr @storage_type(ptr %p_type_str55)
  store ptr %calltmp56, ptr %p_store_type, align 8
  %structptr57 = load ptr, ptr %param_node47, align 8
  %s1_ptr58 = getelementptr inbounds %ASTNode, ptr %structptr57, i32 0, i32 1
  %s159 = load ptr, ptr %s1_ptr58, align 8
  %p_type_str60 = load ptr, ptr %p_type_str, align 8
  call void @ir_set_var_type(ptr %s159, ptr %p_type_str60)
  %p_store_type61 = load ptr, ptr %p_store_type, align 8
  %structptr62 = load ptr, ptr %param_node47, align 8
  %s1_ptr63 = getelementptr inbounds %ASTNode, ptr %structptr62, i32 0, i32 1
  %s164 = load ptr, ptr %s1_ptr63, align 8
  %calltmp65 = call i32 @ir_alloca(ptr %p_store_type61, ptr %s164)
  %p_store_type66 = load ptr, ptr %p_store_type, align 8
  %structptr67 = load ptr, ptr %param_node47, align 8
  %s1_ptr68 = getelementptr inbounds %ASTNode, ptr %structptr67, i32 0, i32 1
  %s169 = load ptr, ptr %s1_ptr68, align 8
  %calltmp70 = call ptr @str_concat(ptr @.str.425, ptr %s169)
  %structptr71 = load ptr, ptr %param_node47, align 8
  %s1_ptr72 = getelementptr inbounds %ASTNode, ptr %structptr71, i32 0, i32 1
  %s173 = load ptr, ptr %s1_ptr72, align 8
  call void @ir_store(ptr %p_store_type66, ptr %calltmp70, ptr %s173)
  %structptr74 = load ptr, ptr %param_node47, align 8
  %next_ptr75 = getelementptr inbounds %ASTNode, ptr %structptr74, i32 0, i32 8
  %next76 = load ptr, ptr %next_ptr75, align 8
  store ptr %next76, ptr %param_ptr2, align 8
  br label %whilecond40

afterwhile77:                                     ; preds = %whilecond40
  %structptr78 = load ptr, ptr %func1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr78, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp79 = call i32 @str_equals(ptr %child2, ptr @.str.426)
  %eqtmp80 = icmp eq i32 %calltmp79, 0
  %ifcond81 = icmp ne i1 %eqtmp80, false
  br i1 %ifcond81, label %then82, label %ifcont87

then82:                                           ; preds = %afterwhile77
  %structptr83 = load ptr, ptr %func1, align 8
  %child2_ptr84 = getelementptr inbounds %ASTNode, ptr %structptr83, i32 0, i32 6
  %child285 = load ptr, ptr %child2_ptr84, align 8
  %calltmp86 = call ptr @ptr_to_node(ptr %child285)
  call void @predeclare_locals_block(ptr %calltmp86)
  br label %ifcont87

ifcont87:                                         ; preds = %then82, %afterwhile77
  %structptr88 = load ptr, ptr %func1, align 8
  %child2_ptr89 = getelementptr inbounds %ASTNode, ptr %structptr88, i32 0, i32 6
  %child290 = load ptr, ptr %child2_ptr89, align 8
  %calltmp91 = call i32 @str_equals(ptr %child290, ptr @.str.427)
  %eqtmp92 = icmp eq i32 %calltmp91, 0
  %ifcond93 = icmp ne i1 %eqtmp92, false
  br i1 %ifcond93, label %then94, label %ifcont99

then94:                                           ; preds = %ifcont87
  %structptr95 = load ptr, ptr %func1, align 8
  %child2_ptr96 = getelementptr inbounds %ASTNode, ptr %structptr95, i32 0, i32 6
  %child297 = load ptr, ptr %child2_ptr96, align 8
  %calltmp98 = call ptr @ptr_to_node(ptr %child297)
  call void @generate_block(ptr %calltmp98)
  br label %ifcont99

ifcont99:                                         ; preds = %then94, %ifcont87
  %calltmp100 = call i32 @ir_has_returned()
  %eqtmp101 = icmp eq i32 %calltmp100, 0
  %ifcond102 = icmp ne i1 %eqtmp101, false
  br i1 %ifcond102, label %then103, label %ifcont117

then103:                                          ; preds = %ifcont99
  %ret_sig_type104 = load ptr, ptr %ret_sig_type, align 8
  %calltmp105 = call i32 @str_equals(ptr %ret_sig_type104, ptr @.str.428)
  %eqtmp106 = icmp eq i32 %calltmp105, 1
  %ifcond107 = icmp ne i1 %eqtmp106, false
  br i1 %ifcond107, label %then108, label %else

then108:                                          ; preds = %then103
  call void @ir_ret_void()
  br label %ifcont116

else:                                             ; preds = %then103
  %is_main109 = load i32, ptr %is_main, align 4
  %eqtmp110 = icmp eq i32 %is_main109, 1
  %ifcond111 = icmp ne i1 %eqtmp110, false
  br i1 %ifcond111, label %then112, label %else113

then112:                                          ; preds = %else
  call void @ir_ret(ptr @.str.429, ptr @.str.430)
  br label %ifcont115

else113:                                          ; preds = %else
  %ret_sig_type114 = load ptr, ptr %ret_sig_type, align 8
  call void @ir_ret(ptr %ret_sig_type114, ptr @.str.431)
  br label %ifcont115

ifcont115:                                        ; preds = %else113, %then112
  br label %ifcont116

ifcont116:                                        ; preds = %ifcont115, %then108
  br label %ifcont117

ifcont117:                                        ; preds = %ifcont116, %ifcont99
  call void @ir_function_end()
  ret void
}

define void @collect_strings_expr(ptr %expr) {
entry:
  %field = alloca ptr, align 8
  %field_ptr = alloca ptr, align 8
  %elem_node = alloca ptr, align 8
  %elem_ptr = alloca ptr, align 8
  %arg_node = alloca ptr, align 8
  %arg_ptr = alloca ptr, align 8
  %str_name = alloca ptr, align 8
  %expr1 = alloca ptr, align 8
  store ptr %expr, ptr %expr1, align 8
  %structptr = load ptr, ptr %expr1, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp = icmp eq i32 %kind, 22
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont12

then:                                             ; preds = %entry
  %structptr2 = load ptr, ptr %expr1, align 8
  %i1_ptr = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 3
  %i1 = load i32, ptr %i1_ptr, align 4
  %eqtmp3 = icmp eq i32 %i1, 0
  %ifcond4 = icmp ne i1 %eqtmp3, false
  br i1 %ifcond4, label %then5, label %ifcont

then5:                                            ; preds = %then
  %ir_string_counter = load i32, ptr @ir_string_counter, align 4
  %calltmp = call ptr @int_to_str(i32 %ir_string_counter)
  %calltmp6 = call ptr @str_concat(ptr @.str.432, ptr %calltmp)
  store ptr %calltmp6, ptr %str_name, align 8
  %ir_string_counter7 = load i32, ptr @ir_string_counter, align 4
  %addtmp = add i32 %ir_string_counter7, 1
  store i32 %addtmp, ptr @ir_string_counter, align 4
  %str_name8 = load ptr, ptr %str_name, align 8
  %structptr9 = load ptr, ptr %expr1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr9, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  call void @ir_global_string(ptr %str_name8, ptr %s1)
  %str_name10 = load ptr, ptr %str_name, align 8
  %structptr11 = load ptr, ptr %expr1, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 2
  store ptr %str_name10, ptr %fieldptr, align 8
  br label %ifcont

ifcont:                                           ; preds = %then5, %then
  br label %ifcont12

ifcont12:                                         ; preds = %ifcont, %entry
  %structptr13 = load ptr, ptr %expr1, align 8
  %kind_ptr14 = getelementptr inbounds %ASTNode, ptr %structptr13, i32 0, i32 0
  %kind15 = load i32, ptr %kind_ptr14, align 4
  %eqtmp16 = icmp eq i32 %kind15, 20
  %ifcond17 = icmp ne i1 %eqtmp16, false
  br i1 %ifcond17, label %then18, label %ifcont39

then18:                                           ; preds = %ifcont12
  %structptr19 = load ptr, ptr %expr1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr19, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp20 = call i32 @str_equals(ptr %child1, ptr @.str.433)
  %eqtmp21 = icmp eq i32 %calltmp20, 0
  %ifcond22 = icmp ne i1 %eqtmp21, false
  br i1 %ifcond22, label %then23, label %ifcont28

then23:                                           ; preds = %then18
  %structptr24 = load ptr, ptr %expr1, align 8
  %child1_ptr25 = getelementptr inbounds %ASTNode, ptr %structptr24, i32 0, i32 5
  %child126 = load ptr, ptr %child1_ptr25, align 8
  %calltmp27 = call ptr @ptr_to_node(ptr %child126)
  call void @collect_strings_expr(ptr %calltmp27)
  br label %ifcont28

ifcont28:                                         ; preds = %then23, %then18
  %structptr29 = load ptr, ptr %expr1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr29, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp30 = call i32 @str_equals(ptr %child2, ptr @.str.434)
  %eqtmp31 = icmp eq i32 %calltmp30, 0
  %ifcond32 = icmp ne i1 %eqtmp31, false
  br i1 %ifcond32, label %then33, label %ifcont38

then33:                                           ; preds = %ifcont28
  %structptr34 = load ptr, ptr %expr1, align 8
  %child2_ptr35 = getelementptr inbounds %ASTNode, ptr %structptr34, i32 0, i32 6
  %child236 = load ptr, ptr %child2_ptr35, align 8
  %calltmp37 = call ptr @ptr_to_node(ptr %child236)
  call void @collect_strings_expr(ptr %calltmp37)
  br label %ifcont38

ifcont38:                                         ; preds = %then33, %ifcont28
  br label %ifcont39

ifcont39:                                         ; preds = %ifcont38, %ifcont12
  %structptr40 = load ptr, ptr %expr1, align 8
  %kind_ptr41 = getelementptr inbounds %ASTNode, ptr %structptr40, i32 0, i32 0
  %kind42 = load i32, ptr %kind_ptr41, align 4
  %eqtmp43 = icmp eq i32 %kind42, 24
  %ifcond44 = icmp ne i1 %eqtmp43, false
  br i1 %ifcond44, label %then45, label %ifcont56

then45:                                           ; preds = %ifcont39
  %structptr46 = load ptr, ptr %expr1, align 8
  %child2_ptr47 = getelementptr inbounds %ASTNode, ptr %structptr46, i32 0, i32 6
  %child248 = load ptr, ptr %child2_ptr47, align 8
  store ptr %child248, ptr %arg_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %then45
  %arg_ptr49 = load ptr, ptr %arg_ptr, align 8
  %calltmp50 = call i32 @str_equals(ptr %arg_ptr49, ptr @.str.435)
  %eqtmp51 = icmp eq i32 %calltmp50, 0
  br i1 %eqtmp51, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %arg_ptr52 = load ptr, ptr %arg_ptr, align 8
  %calltmp53 = call ptr @ptr_to_node(ptr %arg_ptr52)
  store ptr %calltmp53, ptr %arg_node, align 8
  %arg_node54 = load ptr, ptr %arg_node, align 8
  call void @collect_strings_expr(ptr %arg_node54)
  %structptr55 = load ptr, ptr %arg_node, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr55, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %arg_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  br label %ifcont56

ifcont56:                                         ; preds = %afterwhile, %ifcont39
  %structptr57 = load ptr, ptr %expr1, align 8
  %kind_ptr58 = getelementptr inbounds %ASTNode, ptr %structptr57, i32 0, i32 0
  %kind59 = load i32, ptr %kind_ptr58, align 4
  %eqtmp60 = icmp eq i32 %kind59, 27
  %ifcond61 = icmp ne i1 %eqtmp60, false
  br i1 %ifcond61, label %then62, label %ifcont78

then62:                                           ; preds = %ifcont56
  %structptr63 = load ptr, ptr %expr1, align 8
  %child1_ptr64 = getelementptr inbounds %ASTNode, ptr %structptr63, i32 0, i32 5
  %child165 = load ptr, ptr %child1_ptr64, align 8
  store ptr %child165, ptr %elem_ptr, align 8
  br label %whilecond66

whilecond66:                                      ; preds = %whilebody70, %then62
  %elem_ptr67 = load ptr, ptr %elem_ptr, align 8
  %calltmp68 = call i32 @str_equals(ptr %elem_ptr67, ptr @.str.436)
  %eqtmp69 = icmp eq i32 %calltmp68, 0
  br i1 %eqtmp69, label %whilebody70, label %afterwhile77

whilebody70:                                      ; preds = %whilecond66
  %elem_ptr71 = load ptr, ptr %elem_ptr, align 8
  %calltmp72 = call ptr @ptr_to_node(ptr %elem_ptr71)
  store ptr %calltmp72, ptr %elem_node, align 8
  %elem_node73 = load ptr, ptr %elem_node, align 8
  call void @collect_strings_expr(ptr %elem_node73)
  %structptr74 = load ptr, ptr %elem_node, align 8
  %next_ptr75 = getelementptr inbounds %ASTNode, ptr %structptr74, i32 0, i32 8
  %next76 = load ptr, ptr %next_ptr75, align 8
  store ptr %next76, ptr %elem_ptr, align 8
  br label %whilecond66

afterwhile77:                                     ; preds = %whilecond66
  br label %ifcont78

ifcont78:                                         ; preds = %afterwhile77, %ifcont56
  %structptr79 = load ptr, ptr %expr1, align 8
  %kind_ptr80 = getelementptr inbounds %ASTNode, ptr %structptr79, i32 0, i32 0
  %kind81 = load i32, ptr %kind_ptr80, align 4
  %eqtmp82 = icmp eq i32 %kind81, 26
  %ifcond83 = icmp ne i1 %eqtmp82, false
  br i1 %ifcond83, label %then84, label %ifcont109

then84:                                           ; preds = %ifcont78
  %structptr85 = load ptr, ptr %expr1, align 8
  %child1_ptr86 = getelementptr inbounds %ASTNode, ptr %structptr85, i32 0, i32 5
  %child187 = load ptr, ptr %child1_ptr86, align 8
  %calltmp88 = call i32 @str_equals(ptr %child187, ptr @.str.437)
  %eqtmp89 = icmp eq i32 %calltmp88, 0
  %ifcond90 = icmp ne i1 %eqtmp89, false
  br i1 %ifcond90, label %then91, label %ifcont96

then91:                                           ; preds = %then84
  %structptr92 = load ptr, ptr %expr1, align 8
  %child1_ptr93 = getelementptr inbounds %ASTNode, ptr %structptr92, i32 0, i32 5
  %child194 = load ptr, ptr %child1_ptr93, align 8
  %calltmp95 = call ptr @ptr_to_node(ptr %child194)
  call void @collect_strings_expr(ptr %calltmp95)
  br label %ifcont96

ifcont96:                                         ; preds = %then91, %then84
  %structptr97 = load ptr, ptr %expr1, align 8
  %child2_ptr98 = getelementptr inbounds %ASTNode, ptr %structptr97, i32 0, i32 6
  %child299 = load ptr, ptr %child2_ptr98, align 8
  %calltmp100 = call i32 @str_equals(ptr %child299, ptr @.str.438)
  %eqtmp101 = icmp eq i32 %calltmp100, 0
  %ifcond102 = icmp ne i1 %eqtmp101, false
  br i1 %ifcond102, label %then103, label %ifcont108

then103:                                          ; preds = %ifcont96
  %structptr104 = load ptr, ptr %expr1, align 8
  %child2_ptr105 = getelementptr inbounds %ASTNode, ptr %structptr104, i32 0, i32 6
  %child2106 = load ptr, ptr %child2_ptr105, align 8
  %calltmp107 = call ptr @ptr_to_node(ptr %child2106)
  call void @collect_strings_expr(ptr %calltmp107)
  br label %ifcont108

ifcont108:                                        ; preds = %then103, %ifcont96
  br label %ifcont109

ifcont109:                                        ; preds = %ifcont108, %ifcont78
  %structptr110 = load ptr, ptr %expr1, align 8
  %kind_ptr111 = getelementptr inbounds %ASTNode, ptr %structptr110, i32 0, i32 0
  %kind112 = load i32, ptr %kind_ptr111, align 4
  %eqtmp113 = icmp eq i32 %kind112, 25
  %ifcond114 = icmp ne i1 %eqtmp113, false
  br i1 %ifcond114, label %then115, label %ifcont128

then115:                                          ; preds = %ifcont109
  %structptr116 = load ptr, ptr %expr1, align 8
  %child1_ptr117 = getelementptr inbounds %ASTNode, ptr %structptr116, i32 0, i32 5
  %child1118 = load ptr, ptr %child1_ptr117, align 8
  %calltmp119 = call i32 @str_equals(ptr %child1118, ptr @.str.439)
  %eqtmp120 = icmp eq i32 %calltmp119, 0
  %ifcond121 = icmp ne i1 %eqtmp120, false
  br i1 %ifcond121, label %then122, label %ifcont127

then122:                                          ; preds = %then115
  %structptr123 = load ptr, ptr %expr1, align 8
  %child1_ptr124 = getelementptr inbounds %ASTNode, ptr %structptr123, i32 0, i32 5
  %child1125 = load ptr, ptr %child1_ptr124, align 8
  %calltmp126 = call ptr @ptr_to_node(ptr %child1125)
  call void @collect_strings_expr(ptr %calltmp126)
  br label %ifcont127

ifcont127:                                        ; preds = %then122, %then115
  br label %ifcont128

ifcont128:                                        ; preds = %ifcont127, %ifcont109
  %structptr129 = load ptr, ptr %expr1, align 8
  %kind_ptr130 = getelementptr inbounds %ASTNode, ptr %structptr129, i32 0, i32 0
  %kind131 = load i32, ptr %kind_ptr130, align 4
  %eqtmp132 = icmp eq i32 %kind131, 28
  %ifcond133 = icmp ne i1 %eqtmp132, false
  br i1 %ifcond133, label %then134, label %ifcont161

then134:                                          ; preds = %ifcont128
  %structptr135 = load ptr, ptr %expr1, align 8
  %child1_ptr136 = getelementptr inbounds %ASTNode, ptr %structptr135, i32 0, i32 5
  %child1137 = load ptr, ptr %child1_ptr136, align 8
  store ptr %child1137, ptr %field_ptr, align 8
  br label %whilecond138

whilecond138:                                     ; preds = %ifcont156, %then134
  %field_ptr139 = load ptr, ptr %field_ptr, align 8
  %calltmp140 = call i32 @str_equals(ptr %field_ptr139, ptr @.str.440)
  %eqtmp141 = icmp eq i32 %calltmp140, 0
  br i1 %eqtmp141, label %whilebody142, label %afterwhile160

whilebody142:                                     ; preds = %whilecond138
  %field_ptr143 = load ptr, ptr %field_ptr, align 8
  %calltmp144 = call ptr @ptr_to_node(ptr %field_ptr143)
  store ptr %calltmp144, ptr %field, align 8
  %structptr145 = load ptr, ptr %field, align 8
  %child1_ptr146 = getelementptr inbounds %ASTNode, ptr %structptr145, i32 0, i32 5
  %child1147 = load ptr, ptr %child1_ptr146, align 8
  %calltmp148 = call i32 @str_equals(ptr %child1147, ptr @.str.441)
  %eqtmp149 = icmp eq i32 %calltmp148, 0
  %ifcond150 = icmp ne i1 %eqtmp149, false
  br i1 %ifcond150, label %then151, label %ifcont156

then151:                                          ; preds = %whilebody142
  %structptr152 = load ptr, ptr %field, align 8
  %child1_ptr153 = getelementptr inbounds %ASTNode, ptr %structptr152, i32 0, i32 5
  %child1154 = load ptr, ptr %child1_ptr153, align 8
  %calltmp155 = call ptr @ptr_to_node(ptr %child1154)
  call void @collect_strings_expr(ptr %calltmp155)
  br label %ifcont156

ifcont156:                                        ; preds = %then151, %whilebody142
  %structptr157 = load ptr, ptr %field, align 8
  %next_ptr158 = getelementptr inbounds %ASTNode, ptr %structptr157, i32 0, i32 8
  %next159 = load ptr, ptr %next_ptr158, align 8
  store ptr %next159, ptr %field_ptr, align 8
  br label %whilecond138

afterwhile160:                                    ; preds = %whilecond138
  br label %ifcont161

ifcont161:                                        ; preds = %afterwhile160, %ifcont128
  ret void
}

define void @declare_extern_function(ptr %ext) {
entry:
  %p_type_node = alloca ptr, align 8
  %param_node = alloca ptr, align 8
  %param_ptr = alloca ptr, align 8
  %ret_type = alloca ptr, align 8
  %ext1 = alloca ptr, align 8
  store ptr %ext, ptr %ext1, align 8
  %ext2 = load ptr, ptr %ext1, align 8
  %structptr = load ptr, ptr %ext1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp = call ptr @get_declared_return_type(ptr %ext2, ptr %child2)
  store ptr %calltmp, ptr %ret_type, align 8
  %structptr3 = load ptr, ptr %ext1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr3, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %calltmp4 = call ptr @fn_key(ptr %s1)
  %ret_type5 = load ptr, ptr %ret_type, align 8
  call void @ir_set_var_type(ptr %calltmp4, ptr %ret_type5)
  %structptr6 = load ptr, ptr %ext1, align 8
  %s1_ptr7 = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 1
  %s18 = load ptr, ptr %s1_ptr7, align 8
  %ret_type9 = load ptr, ptr %ret_type, align 8
  %calltmp10 = call ptr @storage_type(ptr %ret_type9)
  call void @ir_declare_function_begin(ptr %s18, ptr %calltmp10)
  %structptr11 = load ptr, ptr %ext1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %param_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %param_ptr12 = load ptr, ptr %param_ptr, align 8
  %calltmp13 = call i32 @str_equals(ptr %param_ptr12, ptr @.str.442)
  %eqtmp = icmp eq i32 %calltmp13, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %param_ptr14 = load ptr, ptr %param_ptr, align 8
  %calltmp15 = call ptr @ptr_to_node(ptr %param_ptr14)
  store ptr %calltmp15, ptr %param_node, align 8
  %structptr16 = load ptr, ptr %param_node, align 8
  %child1_ptr17 = getelementptr inbounds %ASTNode, ptr %structptr16, i32 0, i32 5
  %child118 = load ptr, ptr %child1_ptr17, align 8
  %calltmp19 = call ptr @ptr_to_node(ptr %child118)
  store ptr %calltmp19, ptr %p_type_node, align 8
  %p_type_node20 = load ptr, ptr %p_type_node, align 8
  %calltmp21 = call ptr @map_type_node(ptr %p_type_node20)
  %calltmp22 = call ptr @storage_type(ptr %calltmp21)
  call void @ir_declare_function_param(ptr %calltmp22)
  %structptr23 = load ptr, ptr %param_node, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr23, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %param_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  call void @ir_declare_function_end()
  ret void
}

define i1 @module_has_function(ptr %module, ptr %name) {
entry:
  %stmt = alloca ptr, align 8
  %stmt_ptr = alloca ptr, align 8
  %name2 = alloca ptr, align 8
  %module1 = alloca ptr, align 8
  store ptr %module, ptr %module1, align 8
  store ptr %name, ptr %name2, align 8
  %structptr = load ptr, ptr %module1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %stmt_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %stmt_ptr3 = load ptr, ptr %stmt_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %stmt_ptr3, ptr @.str.443)
  %eqtmp = icmp eq i32 %calltmp, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %stmt_ptr4 = load ptr, ptr %stmt_ptr, align 8
  %calltmp5 = call ptr @ptr_to_node(ptr %stmt_ptr4)
  store ptr %calltmp5, ptr %stmt, align 8
  %structptr6 = load ptr, ptr %stmt, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp7 = icmp eq i32 %kind, 4
  %structptr8 = load ptr, ptr %stmt, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr8, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %name9 = load ptr, ptr %name2, align 8
  %calltmp10 = call i32 @str_equals(ptr %s1, ptr %name9)
  %eqtmp11 = icmp eq i32 %calltmp10, 1
  %andtmp = and i1 %eqtmp7, %eqtmp11
  %ifcond = icmp ne i1 %andtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %whilebody
  ret i1 true

ifcont:                                           ; preds = %whilebody
  %structptr12 = load ptr, ptr %stmt, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr12, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %stmt_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret i1 false
}

define void @register_enum_decl(ptr %enum_node) {
entry:
  %variant = alloca ptr, align 8
  %value = alloca i32, align 4
  %variant_ptr = alloca ptr, align 8
  %enum_node1 = alloca ptr, align 8
  store ptr %enum_node, ptr %enum_node1, align 8
  %structptr = load ptr, ptr %enum_node1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %variant_ptr, align 8
  store i32 0, ptr %value, align 4
  br label %whilecond

whilecond:                                        ; preds = %whilebody, %entry
  %variant_ptr2 = load ptr, ptr %variant_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %variant_ptr2, ptr @.str.444)
  %eqtmp = icmp eq i32 %calltmp, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %variant_ptr3 = load ptr, ptr %variant_ptr, align 8
  %calltmp4 = call ptr @ptr_to_node(ptr %variant_ptr3)
  store ptr %calltmp4, ptr %variant, align 8
  %structptr5 = load ptr, ptr %enum_node1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %structptr6 = load ptr, ptr %variant, align 8
  %s1_ptr7 = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 1
  %s18 = load ptr, ptr %s1_ptr7, align 8
  %value9 = load i32, ptr %value, align 4
  call void @ir_register_enum_variant(ptr %s1, ptr %s18, i32 %value9)
  %value10 = load i32, ptr %value, align 4
  %addtmp = add i32 %value10, 1
  store i32 %addtmp, ptr %value, align 4
  %structptr11 = load ptr, ptr %variant, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr11, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %variant_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret void
}

define void @register_struct_name(ptr %struct_node) {
entry:
  %struct_node1 = alloca ptr, align 8
  store ptr %struct_node, ptr %struct_node1, align 8
  %structptr = load ptr, ptr %struct_node1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  call void @ir_register_struct(ptr %s1)
  ret void
}

define void @generate_struct_decl(ptr %struct_node) {
entry:
  %field_type = alloca ptr, align 8
  %type_node = alloca ptr, align 8
  %field = alloca ptr, align 8
  %field_count = alloca i32, align 4
  %field_ptr = alloca ptr, align 8
  %first_field = alloca ptr, align 8
  %first_field_ptr = alloca ptr, align 8
  %struct_node1 = alloca ptr, align 8
  store ptr %struct_node, ptr %struct_node1, align 8
  %structptr = load ptr, ptr %struct_node1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %first_field_ptr, align 8
  %first_field_ptr2 = load ptr, ptr %first_field_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %first_field_ptr2, ptr @.str.445)
  %eqtmp = icmp eq i32 %calltmp, 0
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont12

then:                                             ; preds = %entry
  %first_field_ptr3 = load ptr, ptr %first_field_ptr, align 8
  %calltmp4 = call ptr @ptr_to_node(ptr %first_field_ptr3)
  store ptr %calltmp4, ptr %first_field, align 8
  %structptr5 = load ptr, ptr %struct_node1, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %structptr6 = load ptr, ptr %first_field, align 8
  %s1_ptr7 = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 1
  %s18 = load ptr, ptr %s1_ptr7, align 8
  %calltmp9 = call i32 @ir_get_struct_field_index(ptr %s1, ptr %s18)
  %getmp = icmp sge i32 %calltmp9, 0
  %ifcond10 = icmp ne i1 %getmp, false
  br i1 %ifcond10, label %then11, label %ifcont

then11:                                           ; preds = %then
  ret void

ifcont:                                           ; preds = %then
  br label %ifcont12

ifcont12:                                         ; preds = %ifcont, %entry
  call void @ir_append(ptr @.str.446)
  %structptr13 = load ptr, ptr %struct_node1, align 8
  %s1_ptr14 = getelementptr inbounds %ASTNode, ptr %structptr13, i32 0, i32 1
  %s115 = load ptr, ptr %s1_ptr14, align 8
  call void @ir_append(ptr %s115)
  call void @ir_append(ptr @.str.447)
  %structptr16 = load ptr, ptr %struct_node1, align 8
  %child1_ptr17 = getelementptr inbounds %ASTNode, ptr %structptr16, i32 0, i32 5
  %child118 = load ptr, ptr %child1_ptr17, align 8
  store ptr %child118, ptr %field_ptr, align 8
  store i32 0, ptr %field_count, align 4
  br label %whilecond

whilecond:                                        ; preds = %ifcont41, %ifcont12
  %field_ptr19 = load ptr, ptr %field_ptr, align 8
  %calltmp20 = call i32 @str_equals(ptr %field_ptr19, ptr @.str.448)
  %eqtmp21 = icmp eq i32 %calltmp20, 0
  br i1 %eqtmp21, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %field_ptr22 = load ptr, ptr %field_ptr, align 8
  %calltmp23 = call ptr @ptr_to_node(ptr %field_ptr22)
  store ptr %calltmp23, ptr %field, align 8
  %structptr24 = load ptr, ptr %field, align 8
  %child1_ptr25 = getelementptr inbounds %ASTNode, ptr %structptr24, i32 0, i32 5
  %child126 = load ptr, ptr %child1_ptr25, align 8
  %calltmp27 = call ptr @ptr_to_node(ptr %child126)
  store ptr %calltmp27, ptr %type_node, align 8
  %type_node28 = load ptr, ptr %type_node, align 8
  %calltmp29 = call ptr @map_type_node(ptr %type_node28)
  %calltmp30 = call ptr @storage_type(ptr %calltmp29)
  store ptr %calltmp30, ptr %field_type, align 8
  %structptr31 = load ptr, ptr %struct_node1, align 8
  %s1_ptr32 = getelementptr inbounds %ASTNode, ptr %structptr31, i32 0, i32 1
  %s133 = load ptr, ptr %s1_ptr32, align 8
  %structptr34 = load ptr, ptr %field, align 8
  %s1_ptr35 = getelementptr inbounds %ASTNode, ptr %structptr34, i32 0, i32 1
  %s136 = load ptr, ptr %s1_ptr35, align 8
  %field_type37 = load ptr, ptr %field_type, align 8
  call void @ir_register_struct_field(ptr %s133, ptr %s136, ptr %field_type37)
  %field_count38 = load i32, ptr %field_count, align 4
  %gttmp = icmp sgt i32 %field_count38, 0
  %ifcond39 = icmp ne i1 %gttmp, false
  br i1 %ifcond39, label %then40, label %ifcont41

then40:                                           ; preds = %whilebody
  call void @ir_append(ptr @.str.449)
  br label %ifcont41

ifcont41:                                         ; preds = %then40, %whilebody
  %field_type42 = load ptr, ptr %field_type, align 8
  call void @ir_append(ptr %field_type42)
  %field_count43 = load i32, ptr %field_count, align 4
  %addtmp = add i32 %field_count43, 1
  store i32 %addtmp, ptr %field_count, align 4
  %structptr44 = load ptr, ptr %field, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr44, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %field_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  call void @ir_append_line(ptr @.str.450)
  ret void
}

define void @collect_strings_function(ptr %func) {
entry:
  %func1 = alloca ptr, align 8
  store ptr %func, ptr %func1, align 8
  %structptr = load ptr, ptr %func1, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %child2, ptr @.str.457)
  %eqtmp = icmp eq i32 %calltmp, 0
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %structptr2 = load ptr, ptr %func1, align 8
  %child2_ptr3 = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 6
  %child24 = load ptr, ptr %child2_ptr3, align 8
  %calltmp5 = call ptr @ptr_to_node(ptr %child24)
  call void @collect_strings_block(ptr %calltmp5)
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  ret void
}

define void @generate_module(ptr %module) {
entry:
  %stmt2 = alloca ptr, align 8
  %stmt_ptr2 = alloca ptr, align 8
  %ret_type = alloca ptr, align 8
  %init_node = alloca ptr, align 8
  %type_node = alloca ptr, align 8
  %var_type = alloca ptr, align 8
  %init_val = alloca ptr, align 8
  %stmt = alloca ptr, align 8
  %stmt_ptr = alloca ptr, align 8
  %struct_stmt = alloca ptr, align 8
  %struct_stmt_ptr = alloca ptr, align 8
  %type_stmt = alloca ptr, align 8
  %type_stmt_ptr = alloca ptr, align 8
  %module1 = alloca ptr, align 8
  store ptr %module, ptr %module1, align 8
  call void @ir_reset_globals()
  call void @ir_reset_types()
  call void @ir_clear_var_types()
  call void @ir_module_start(ptr @.str.458)
  %structptr = load ptr, ptr %module1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %type_stmt_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont15, %entry
  %type_stmt_ptr2 = load ptr, ptr %type_stmt_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %type_stmt_ptr2, ptr @.str.459)
  %eqtmp = icmp eq i32 %calltmp, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %type_stmt_ptr3 = load ptr, ptr %type_stmt_ptr, align 8
  %calltmp4 = call ptr @ptr_to_node(ptr %type_stmt_ptr3)
  store ptr %calltmp4, ptr %type_stmt, align 8
  %structptr5 = load ptr, ptr %type_stmt, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr5, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp6 = icmp eq i32 %kind, 6
  %ifcond = icmp ne i1 %eqtmp6, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %whilebody
  %type_stmt7 = load ptr, ptr %type_stmt, align 8
  call void @register_enum_decl(ptr %type_stmt7)
  br label %ifcont

ifcont:                                           ; preds = %then, %whilebody
  %structptr8 = load ptr, ptr %type_stmt, align 8
  %kind_ptr9 = getelementptr inbounds %ASTNode, ptr %structptr8, i32 0, i32 0
  %kind10 = load i32, ptr %kind_ptr9, align 4
  %eqtmp11 = icmp eq i32 %kind10, 5
  %ifcond12 = icmp ne i1 %eqtmp11, false
  br i1 %ifcond12, label %then13, label %ifcont15

then13:                                           ; preds = %ifcont
  %type_stmt14 = load ptr, ptr %type_stmt, align 8
  call void @register_struct_name(ptr %type_stmt14)
  br label %ifcont15

ifcont15:                                         ; preds = %then13, %ifcont
  %structptr16 = load ptr, ptr %type_stmt, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr16, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %type_stmt_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %structptr17 = load ptr, ptr %module1, align 8
  %child1_ptr18 = getelementptr inbounds %ASTNode, ptr %structptr17, i32 0, i32 5
  %child119 = load ptr, ptr %child1_ptr18, align 8
  store ptr %child119, ptr %struct_stmt_ptr, align 8
  br label %whilecond20

whilecond20:                                      ; preds = %ifcont34, %afterwhile
  %struct_stmt_ptr21 = load ptr, ptr %struct_stmt_ptr, align 8
  %calltmp22 = call i32 @str_equals(ptr %struct_stmt_ptr21, ptr @.str.460)
  %eqtmp23 = icmp eq i32 %calltmp22, 0
  br i1 %eqtmp23, label %whilebody24, label %afterwhile38

whilebody24:                                      ; preds = %whilecond20
  %struct_stmt_ptr25 = load ptr, ptr %struct_stmt_ptr, align 8
  %calltmp26 = call ptr @ptr_to_node(ptr %struct_stmt_ptr25)
  store ptr %calltmp26, ptr %struct_stmt, align 8
  %structptr27 = load ptr, ptr %struct_stmt, align 8
  %kind_ptr28 = getelementptr inbounds %ASTNode, ptr %structptr27, i32 0, i32 0
  %kind29 = load i32, ptr %kind_ptr28, align 4
  %eqtmp30 = icmp eq i32 %kind29, 5
  %ifcond31 = icmp ne i1 %eqtmp30, false
  br i1 %ifcond31, label %then32, label %ifcont34

then32:                                           ; preds = %whilebody24
  %struct_stmt33 = load ptr, ptr %struct_stmt, align 8
  call void @generate_struct_decl(ptr %struct_stmt33)
  br label %ifcont34

ifcont34:                                         ; preds = %then32, %whilebody24
  %structptr35 = load ptr, ptr %struct_stmt, align 8
  %next_ptr36 = getelementptr inbounds %ASTNode, ptr %structptr35, i32 0, i32 8
  %next37 = load ptr, ptr %next_ptr36, align 8
  store ptr %next37, ptr %struct_stmt_ptr, align 8
  br label %whilecond20

afterwhile38:                                     ; preds = %whilecond20
  call void @ir_blank_line()
  call void @ir_declare_function_begin(ptr @.str.461, ptr @.str.462)
  call void @ir_declare_function_param(ptr @.str.463)
  call void @ir_declare_function_end()
  call void @ir_declare_function_begin(ptr @.str.464, ptr @.str.465)
  call void @ir_declare_function_param(ptr @.str.466)
  call void @ir_declare_function_end()
  call void @ir_declare_function_begin(ptr @.str.467, ptr @.str.468)
  call void @ir_declare_function_param(ptr @.str.469)
  call void @ir_declare_function_end()
  call void @ir_declare_function_begin(ptr @.str.470, ptr @.str.471)
  call void @ir_declare_function_param(ptr @.str.472)
  call void @ir_declare_function_end()
  call void @ir_declare_function_begin(ptr @.str.473, ptr @.str.474)
  call void @ir_declare_function_param(ptr @.str.475)
  call void @ir_declare_function_end()
  call void @ir_declare_function_begin(ptr @.str.476, ptr @.str.477)
  call void @ir_declare_function_param(ptr @.str.478)
  call void @ir_declare_function_end()
  call void @ir_declare_function_begin(ptr @.str.479, ptr @.str.480)
  call void @ir_declare_function_param(ptr @.str.481)
  call void @ir_declare_function_end()
  call void @ir_declare_function_begin(ptr @.str.482, ptr @.str.483)
  call void @ir_declare_function_param(ptr @.str.484)
  call void @ir_declare_function_end()
  call void @ir_declare_function_begin(ptr @.str.485, ptr @.str.486)
  call void @ir_declare_function_param(ptr @.str.487)
  call void @ir_declare_function_end()
  call void @ir_blank_line()
  %structptr39 = load ptr, ptr %module1, align 8
  %child1_ptr40 = getelementptr inbounds %ASTNode, ptr %structptr39, i32 0, i32 5
  %child141 = load ptr, ptr %child1_ptr40, align 8
  store ptr %child141, ptr %stmt_ptr, align 8
  br label %whilecond42

whilecond42:                                      ; preds = %ifcont143, %afterwhile38
  %stmt_ptr43 = load ptr, ptr %stmt_ptr, align 8
  %calltmp44 = call i32 @str_equals(ptr %stmt_ptr43, ptr @.str.488)
  %eqtmp45 = icmp eq i32 %calltmp44, 0
  br i1 %eqtmp45, label %whilebody46, label %afterwhile147

whilebody46:                                      ; preds = %whilecond42
  %stmt_ptr47 = load ptr, ptr %stmt_ptr, align 8
  %calltmp48 = call ptr @ptr_to_node(ptr %stmt_ptr47)
  store ptr %calltmp48, ptr %stmt, align 8
  %structptr49 = load ptr, ptr %stmt, align 8
  %kind_ptr50 = getelementptr inbounds %ASTNode, ptr %structptr49, i32 0, i32 0
  %kind51 = load i32, ptr %kind_ptr50, align 4
  %eqtmp52 = icmp eq i32 %kind51, 2
  %ifcond53 = icmp ne i1 %eqtmp52, false
  br i1 %ifcond53, label %then54, label %ifcont63

then54:                                           ; preds = %whilebody46
  %module55 = load ptr, ptr %module1, align 8
  %structptr56 = load ptr, ptr %stmt, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr56, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %calltmp57 = call i1 @module_has_function(ptr %module55, ptr %s1)
  %eqtmp58 = icmp eq i1 %calltmp57, false
  %ifcond59 = icmp ne i1 %eqtmp58, false
  br i1 %ifcond59, label %then60, label %ifcont62

then60:                                           ; preds = %then54
  %stmt61 = load ptr, ptr %stmt, align 8
  call void @declare_extern_function(ptr %stmt61)
  br label %ifcont62

ifcont62:                                         ; preds = %then60, %then54
  br label %ifcont63

ifcont63:                                         ; preds = %ifcont62, %whilebody46
  %structptr64 = load ptr, ptr %stmt, align 8
  %kind_ptr65 = getelementptr inbounds %ASTNode, ptr %structptr64, i32 0, i32 0
  %kind66 = load i32, ptr %kind_ptr65, align 4
  %eqtmp67 = icmp eq i32 %kind66, 3
  %ifcond68 = icmp ne i1 %eqtmp67, false
  br i1 %ifcond68, label %then69, label %ifcont119

then69:                                           ; preds = %ifcont63
  store ptr @.str.489, ptr %init_val, align 8
  store ptr @.str.490, ptr %var_type, align 8
  %structptr70 = load ptr, ptr %stmt, align 8
  %child1_ptr71 = getelementptr inbounds %ASTNode, ptr %structptr70, i32 0, i32 5
  %child172 = load ptr, ptr %child1_ptr71, align 8
  %calltmp73 = call i32 @str_equals(ptr %child172, ptr @.str.491)
  %eqtmp74 = icmp eq i32 %calltmp73, 0
  %ifcond75 = icmp ne i1 %eqtmp74, false
  br i1 %ifcond75, label %then76, label %ifcont83

then76:                                           ; preds = %then69
  %structptr77 = load ptr, ptr %stmt, align 8
  %child1_ptr78 = getelementptr inbounds %ASTNode, ptr %structptr77, i32 0, i32 5
  %child179 = load ptr, ptr %child1_ptr78, align 8
  %calltmp80 = call ptr @ptr_to_node(ptr %child179)
  store ptr %calltmp80, ptr %type_node, align 8
  %type_node81 = load ptr, ptr %type_node, align 8
  %calltmp82 = call ptr @map_type_node(ptr %type_node81)
  store ptr %calltmp82, ptr %var_type, align 8
  br label %ifcont83

ifcont83:                                         ; preds = %then76, %then69
  %structptr84 = load ptr, ptr %stmt, align 8
  %child2_ptr = getelementptr inbounds %ASTNode, ptr %structptr84, i32 0, i32 6
  %child2 = load ptr, ptr %child2_ptr, align 8
  %calltmp85 = call i32 @str_equals(ptr %child2, ptr @.str.492)
  %eqtmp86 = icmp eq i32 %calltmp85, 0
  %ifcond87 = icmp ne i1 %eqtmp86, false
  br i1 %ifcond87, label %then88, label %ifcont105

then88:                                           ; preds = %ifcont83
  %structptr89 = load ptr, ptr %stmt, align 8
  %child2_ptr90 = getelementptr inbounds %ASTNode, ptr %structptr89, i32 0, i32 6
  %child291 = load ptr, ptr %child2_ptr90, align 8
  %calltmp92 = call ptr @ptr_to_node(ptr %child291)
  store ptr %calltmp92, ptr %init_node, align 8
  %init_node93 = load ptr, ptr %init_node, align 8
  %calltmp94 = call ptr @get_expr_type(ptr %init_node93)
  store ptr %calltmp94, ptr %var_type, align 8
  %structptr95 = load ptr, ptr %init_node, align 8
  %kind_ptr96 = getelementptr inbounds %ASTNode, ptr %structptr95, i32 0, i32 0
  %kind97 = load i32, ptr %kind_ptr96, align 4
  %eqtmp98 = icmp eq i32 %kind97, 22
  %ifcond99 = icmp ne i1 %eqtmp98, false
  br i1 %ifcond99, label %then100, label %ifcont104

then100:                                          ; preds = %then88
  %structptr101 = load ptr, ptr %init_node, align 8
  %s1_ptr102 = getelementptr inbounds %ASTNode, ptr %structptr101, i32 0, i32 1
  %s1103 = load ptr, ptr %s1_ptr102, align 8
  store ptr %s1103, ptr %init_val, align 8
  br label %ifcont104

ifcont104:                                        ; preds = %then100, %then88
  br label %ifcont105

ifcont105:                                        ; preds = %ifcont104, %ifcont83
  %structptr106 = load ptr, ptr %stmt, align 8
  %s1_ptr107 = getelementptr inbounds %ASTNode, ptr %structptr106, i32 0, i32 1
  %s1108 = load ptr, ptr %s1_ptr107, align 8
  %var_type109 = load ptr, ptr %var_type, align 8
  %calltmp110 = call ptr @storage_type(ptr %var_type109)
  %init_val111 = load ptr, ptr %init_val, align 8
  call void @ir_global_var(ptr %s1108, ptr %calltmp110, ptr %init_val111, i32 0)
  %structptr112 = load ptr, ptr %stmt, align 8
  %s1_ptr113 = getelementptr inbounds %ASTNode, ptr %structptr112, i32 0, i32 1
  %s1114 = load ptr, ptr %s1_ptr113, align 8
  call void @ir_register_global_name(ptr %s1114)
  %structptr115 = load ptr, ptr %stmt, align 8
  %s1_ptr116 = getelementptr inbounds %ASTNode, ptr %structptr115, i32 0, i32 1
  %s1117 = load ptr, ptr %s1_ptr116, align 8
  %var_type118 = load ptr, ptr %var_type, align 8
  call void @ir_set_var_type(ptr %s1117, ptr %var_type118)
  br label %ifcont119

ifcont119:                                        ; preds = %ifcont105, %ifcont63
  %structptr120 = load ptr, ptr %stmt, align 8
  %kind_ptr121 = getelementptr inbounds %ASTNode, ptr %structptr120, i32 0, i32 0
  %kind122 = load i32, ptr %kind_ptr121, align 4
  %eqtmp123 = icmp eq i32 %kind122, 4
  %ifcond124 = icmp ne i1 %eqtmp123, false
  br i1 %ifcond124, label %then125, label %ifcont143

then125:                                          ; preds = %ifcont119
  %stmt126 = load ptr, ptr %stmt, align 8
  %structptr127 = load ptr, ptr %stmt, align 8
  %child3_ptr = getelementptr inbounds %ASTNode, ptr %structptr127, i32 0, i32 7
  %child3 = load ptr, ptr %child3_ptr, align 8
  %calltmp128 = call ptr @get_declared_return_type(ptr %stmt126, ptr %child3)
  store ptr %calltmp128, ptr %ret_type, align 8
  %structptr129 = load ptr, ptr %stmt, align 8
  %s1_ptr130 = getelementptr inbounds %ASTNode, ptr %structptr129, i32 0, i32 1
  %s1131 = load ptr, ptr %s1_ptr130, align 8
  %calltmp132 = call i32 @str_equals(ptr %s1131, ptr @.str.493)
  %eqtmp133 = icmp eq i32 %calltmp132, 1
  %ifcond134 = icmp ne i1 %eqtmp133, false
  br i1 %ifcond134, label %then135, label %ifcont136

then135:                                          ; preds = %then125
  store ptr @.str.494, ptr %ret_type, align 8
  br label %ifcont136

ifcont136:                                        ; preds = %then135, %then125
  %structptr137 = load ptr, ptr %stmt, align 8
  %s1_ptr138 = getelementptr inbounds %ASTNode, ptr %structptr137, i32 0, i32 1
  %s1139 = load ptr, ptr %s1_ptr138, align 8
  %calltmp140 = call ptr @fn_key(ptr %s1139)
  %ret_type141 = load ptr, ptr %ret_type, align 8
  call void @ir_set_var_type(ptr %calltmp140, ptr %ret_type141)
  %stmt142 = load ptr, ptr %stmt, align 8
  call void @collect_strings_function(ptr %stmt142)
  br label %ifcont143

ifcont143:                                        ; preds = %ifcont136, %ifcont119
  %structptr144 = load ptr, ptr %stmt, align 8
  %next_ptr145 = getelementptr inbounds %ASTNode, ptr %structptr144, i32 0, i32 8
  %next146 = load ptr, ptr %next_ptr145, align 8
  store ptr %next146, ptr %stmt_ptr, align 8
  br label %whilecond42

afterwhile147:                                    ; preds = %whilecond42
  call void @ir_blank_line()
  %structptr148 = load ptr, ptr %module1, align 8
  %child1_ptr149 = getelementptr inbounds %ASTNode, ptr %structptr148, i32 0, i32 5
  %child1150 = load ptr, ptr %child1_ptr149, align 8
  store ptr %child1150, ptr %stmt_ptr2, align 8
  br label %whilecond151

whilecond151:                                     ; preds = %ifcont165, %afterwhile147
  %stmt_ptr2152 = load ptr, ptr %stmt_ptr2, align 8
  %calltmp153 = call i32 @str_equals(ptr %stmt_ptr2152, ptr @.str.495)
  %eqtmp154 = icmp eq i32 %calltmp153, 0
  br i1 %eqtmp154, label %whilebody155, label %afterwhile169

whilebody155:                                     ; preds = %whilecond151
  %stmt_ptr2156 = load ptr, ptr %stmt_ptr2, align 8
  %calltmp157 = call ptr @ptr_to_node(ptr %stmt_ptr2156)
  store ptr %calltmp157, ptr %stmt2, align 8
  %structptr158 = load ptr, ptr %stmt2, align 8
  %kind_ptr159 = getelementptr inbounds %ASTNode, ptr %structptr158, i32 0, i32 0
  %kind160 = load i32, ptr %kind_ptr159, align 4
  %eqtmp161 = icmp eq i32 %kind160, 4
  %ifcond162 = icmp ne i1 %eqtmp161, false
  br i1 %ifcond162, label %then163, label %ifcont165

then163:                                          ; preds = %whilebody155
  %stmt2164 = load ptr, ptr %stmt2, align 8
  call void @generate_function(ptr %stmt2164)
  br label %ifcont165

ifcont165:                                        ; preds = %then163, %whilebody155
  %structptr166 = load ptr, ptr %stmt2, align 8
  %next_ptr167 = getelementptr inbounds %ASTNode, ptr %structptr166, i32 0, i32 8
  %next168 = load ptr, ptr %next_ptr167, align 8
  store ptr %next168, ptr %stmt_ptr2, align 8
  br label %whilecond151

afterwhile169:                                    ; preds = %whilecond151
  call void @ir_module_end()
  ret void
}

declare ptr @read_file(ptr)

declare ptr @get_directory(ptr)

declare i32 @cli_arg_count()

declare ptr @cli_arg(i32)

define i1 @is_named_top_level(ptr %stmt) {
entry:
  %stmt1 = alloca ptr, align 8
  store ptr %stmt, ptr %stmt1, align 8
  %structptr = load ptr, ptr %stmt1, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp = icmp eq i32 %kind, 2
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 true

ifcont:                                           ; preds = %entry
  %structptr2 = load ptr, ptr %stmt1, align 8
  %kind_ptr3 = getelementptr inbounds %ASTNode, ptr %structptr2, i32 0, i32 0
  %kind4 = load i32, ptr %kind_ptr3, align 4
  %eqtmp5 = icmp eq i32 %kind4, 3
  %ifcond6 = icmp ne i1 %eqtmp5, false
  br i1 %ifcond6, label %then7, label %ifcont8

then7:                                            ; preds = %ifcont
  ret i1 true

ifcont8:                                          ; preds = %ifcont
  %structptr9 = load ptr, ptr %stmt1, align 8
  %kind_ptr10 = getelementptr inbounds %ASTNode, ptr %structptr9, i32 0, i32 0
  %kind11 = load i32, ptr %kind_ptr10, align 4
  %eqtmp12 = icmp eq i32 %kind11, 4
  %ifcond13 = icmp ne i1 %eqtmp12, false
  br i1 %ifcond13, label %then14, label %ifcont15

then14:                                           ; preds = %ifcont8
  ret i1 true

ifcont15:                                         ; preds = %ifcont8
  %structptr16 = load ptr, ptr %stmt1, align 8
  %kind_ptr17 = getelementptr inbounds %ASTNode, ptr %structptr16, i32 0, i32 0
  %kind18 = load i32, ptr %kind_ptr17, align 4
  %eqtmp19 = icmp eq i32 %kind18, 5
  %ifcond20 = icmp ne i1 %eqtmp19, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %ifcont15
  ret i1 true

ifcont22:                                         ; preds = %ifcont15
  %structptr23 = load ptr, ptr %stmt1, align 8
  %kind_ptr24 = getelementptr inbounds %ASTNode, ptr %structptr23, i32 0, i32 0
  %kind25 = load i32, ptr %kind_ptr24, align 4
  %eqtmp26 = icmp eq i32 %kind25, 6
  %ifcond27 = icmp ne i1 %eqtmp26, false
  br i1 %ifcond27, label %then28, label %ifcont29

then28:                                           ; preds = %ifcont22
  ret i1 true

ifcont29:                                         ; preds = %ifcont22
  ret i1 false
}

define i1 @has_named_top_level(ptr %module, ptr %stmt) {
entry:
  %scan = alloca ptr, align 8
  %scan_ptr = alloca ptr, align 8
  %stmt2 = alloca ptr, align 8
  %module1 = alloca ptr, align 8
  store ptr %module, ptr %module1, align 8
  store ptr %stmt, ptr %stmt2, align 8
  %stmt3 = load ptr, ptr %stmt2, align 8
  %calltmp = call i1 @is_named_top_level(ptr %stmt3)
  %eqtmp = icmp eq i1 %calltmp, false
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret i1 false

ifcont:                                           ; preds = %entry
  %structptr = load ptr, ptr %module1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %scan_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont22, %ifcont
  %scan_ptr4 = load ptr, ptr %scan_ptr, align 8
  %calltmp5 = call i32 @str_equals(ptr %scan_ptr4, ptr @.str.496)
  %eqtmp6 = icmp eq i32 %calltmp5, 0
  br i1 %eqtmp6, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %scan_ptr7 = load ptr, ptr %scan_ptr, align 8
  %calltmp8 = call ptr @ptr_to_node(ptr %scan_ptr7)
  store ptr %calltmp8, ptr %scan, align 8
  %structptr9 = load ptr, ptr %scan, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr9, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %structptr10 = load ptr, ptr %stmt2, align 8
  %kind_ptr11 = getelementptr inbounds %ASTNode, ptr %structptr10, i32 0, i32 0
  %kind12 = load i32, ptr %kind_ptr11, align 4
  %eqtmp13 = icmp eq i32 %kind, %kind12
  %structptr14 = load ptr, ptr %scan, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr14, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %structptr15 = load ptr, ptr %stmt2, align 8
  %s1_ptr16 = getelementptr inbounds %ASTNode, ptr %structptr15, i32 0, i32 1
  %s117 = load ptr, ptr %s1_ptr16, align 8
  %calltmp18 = call i32 @str_equals(ptr %s1, ptr %s117)
  %eqtmp19 = icmp eq i32 %calltmp18, 1
  %andtmp = and i1 %eqtmp13, %eqtmp19
  %ifcond20 = icmp ne i1 %andtmp, false
  br i1 %ifcond20, label %then21, label %ifcont22

then21:                                           ; preds = %whilebody
  ret i1 true

ifcont22:                                         ; preds = %whilebody
  %structptr23 = load ptr, ptr %scan, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr23, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %scan_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret i1 false
}

define ptr @parse_source(ptr %content) {
entry:
  %p = alloca ptr, align 8
  %head_token = alloca ptr, align 8
  %lex = alloca ptr, align 8
  %content1 = alloca ptr, align 8
  store ptr %content, ptr %content1, align 8
  %content2 = load ptr, ptr %content1, align 8
  %calltmp = call ptr @create_lexer(ptr %content2)
  store ptr %calltmp, ptr %lex, align 8
  %lex3 = load ptr, ptr %lex, align 8
  %calltmp4 = call ptr @lex_all_tokens(ptr %lex3)
  store ptr %calltmp4, ptr %head_token, align 8
  %head_token5 = load ptr, ptr %head_token, align 8
  %calltmp6 = call ptr @parser_create(ptr %head_token5)
  store ptr %calltmp6, ptr %p, align 8
  %p7 = load ptr, ptr %p, align 8
  %calltmp8 = call ptr @parse_module(ptr %p7)
  ret ptr %calltmp8
}

define void @append_statement(ptr %module, ptr %stmt) {
entry:
  %tail = alloca ptr, align 8
  %searching = alloca i1, align 1
  %tail_ptr = alloca ptr, align 8
  %stmt2 = alloca ptr, align 8
  %module1 = alloca ptr, align 8
  store ptr %module, ptr %module1, align 8
  store ptr %stmt, ptr %stmt2, align 8
  %module3 = load ptr, ptr %module1, align 8
  %stmt4 = load ptr, ptr %stmt2, align 8
  %calltmp = call i1 @has_named_top_level(ptr %module3, ptr %stmt4)
  %ifcond = icmp ne i1 %calltmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  ret void

ifcont:                                           ; preds = %entry
  %structptr = load ptr, ptr %module1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  %calltmp5 = call i32 @str_equals(ptr %child1, ptr @.str.497)
  %eqtmp = icmp eq i32 %calltmp5, 1
  %ifcond6 = icmp ne i1 %eqtmp, false
  br i1 %ifcond6, label %then7, label %ifcont11

then7:                                            ; preds = %ifcont
  %stmt8 = load ptr, ptr %stmt2, align 8
  %calltmp9 = call ptr @node_to_ptr(ptr %stmt8)
  %structptr10 = load ptr, ptr %module1, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr10, i32 0, i32 5
  store ptr %calltmp9, ptr %fieldptr, align 8
  ret void

ifcont11:                                         ; preds = %ifcont
  %structptr12 = load ptr, ptr %module1, align 8
  %child1_ptr13 = getelementptr inbounds %ASTNode, ptr %structptr12, i32 0, i32 5
  %child114 = load ptr, ptr %child1_ptr13, align 8
  store ptr %child114, ptr %tail_ptr, align 8
  store i1 true, ptr %searching, align 1
  br label %whilecond

whilecond:                                        ; preds = %ifcont30, %ifcont11
  %searching15 = load i1, ptr %searching, align 1
  br i1 %searching15, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %tail_ptr16 = load ptr, ptr %tail_ptr, align 8
  %calltmp17 = call ptr @ptr_to_node(ptr %tail_ptr16)
  store ptr %calltmp17, ptr %tail, align 8
  %structptr18 = load ptr, ptr %tail, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr18, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  %calltmp19 = call i32 @str_equals(ptr %next, ptr @.str.498)
  %eqtmp20 = icmp eq i32 %calltmp19, 1
  %ifcond21 = icmp ne i1 %eqtmp20, false
  br i1 %ifcond21, label %then22, label %else

then22:                                           ; preds = %whilebody
  %stmt23 = load ptr, ptr %stmt2, align 8
  %calltmp24 = call ptr @node_to_ptr(ptr %stmt23)
  %structptr25 = load ptr, ptr %tail, align 8
  %fieldptr26 = getelementptr inbounds %ASTNode, ptr %structptr25, i32 0, i32 8
  store ptr %calltmp24, ptr %fieldptr26, align 8
  store i1 false, ptr %searching, align 1
  br label %ifcont30

else:                                             ; preds = %whilebody
  %structptr27 = load ptr, ptr %tail, align 8
  %next_ptr28 = getelementptr inbounds %ASTNode, ptr %structptr27, i32 0, i32 8
  %next29 = load ptr, ptr %next_ptr28, align 8
  store ptr %next29, ptr %tail_ptr, align 8
  br label %ifcont30

ifcont30:                                         ; preds = %else, %then22
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret void
}

define void @append_non_imports(ptr %target, ptr %source) {
entry:
  %next_stmt = alloca ptr, align 8
  %stmt = alloca ptr, align 8
  %stmt_ptr = alloca ptr, align 8
  %source2 = alloca ptr, align 8
  %target1 = alloca ptr, align 8
  store ptr %target, ptr %target1, align 8
  store ptr %source, ptr %source2, align 8
  %structptr = load ptr, ptr %source2, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %stmt_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont, %entry
  %stmt_ptr3 = load ptr, ptr %stmt_ptr, align 8
  %calltmp = call i32 @str_equals(ptr %stmt_ptr3, ptr @.str.499)
  %eqtmp = icmp eq i32 %calltmp, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %stmt_ptr4 = load ptr, ptr %stmt_ptr, align 8
  %calltmp5 = call ptr @ptr_to_node(ptr %stmt_ptr4)
  store ptr %calltmp5, ptr %stmt, align 8
  %structptr6 = load ptr, ptr %stmt, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr6, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %next_stmt, align 8
  %structptr7 = load ptr, ptr %stmt, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 8
  store ptr @.str.500, ptr %fieldptr, align 8
  %structptr8 = load ptr, ptr %stmt, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr8, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %neqtmp = icmp ne i32 %kind, 1
  %ifcond = icmp ne i1 %neqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %whilebody
  %target9 = load ptr, ptr %target1, align 8
  %stmt10 = load ptr, ptr %stmt, align 8
  call void @append_statement(ptr %target9, ptr %stmt10)
  br label %ifcont

ifcont:                                           ; preds = %then, %whilebody
  %next_stmt11 = load ptr, ptr %next_stmt, align 8
  store ptr %next_stmt11, ptr %stmt_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  ret void
}

define ptr @join_import_path(ptr %base_dir, ptr %module_name) {
entry:
  %module_file = alloca ptr, align 8
  %module_name2 = alloca ptr, align 8
  %base_dir1 = alloca ptr, align 8
  store ptr %base_dir, ptr %base_dir1, align 8
  store ptr %module_name, ptr %module_name2, align 8
  %module_name3 = load ptr, ptr %module_name2, align 8
  %calltmp = call ptr @str_concat(ptr %module_name3, ptr @.str.501)
  store ptr %calltmp, ptr %module_file, align 8
  %base_dir4 = load ptr, ptr %base_dir1, align 8
  %calltmp5 = call i32 @str_equals(ptr %base_dir4, ptr @.str.502)
  %eqtmp = icmp eq i32 %calltmp5, 1
  %ifcond = icmp ne i1 %eqtmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %module_file6 = load ptr, ptr %module_file, align 8
  ret ptr %module_file6

ifcont:                                           ; preds = %entry
  %base_dir7 = load ptr, ptr %base_dir1, align 8
  %calltmp8 = call ptr @str_concat(ptr %base_dir7, ptr @.str.503)
  %module_file9 = load ptr, ptr %module_file, align 8
  %calltmp10 = call ptr @str_concat(ptr %calltmp8, ptr %module_file9)
  ret ptr %calltmp10
}

define ptr @resolve_imports(ptr %module, ptr %base_dir) {
entry:
  %resolved_import = alloca ptr, align 8
  %imported_module = alloca ptr, align 8
  %import_content = alloca ptr, align 8
  %import_path = alloca ptr, align 8
  %next_stmt = alloca ptr, align 8
  %stmt = alloca ptr, align 8
  %stmt_ptr = alloca ptr, align 8
  %merged = alloca ptr, align 8
  %base_dir2 = alloca ptr, align 8
  %module1 = alloca ptr, align 8
  store ptr %module, ptr %module1, align 8
  store ptr %base_dir, ptr %base_dir2, align 8
  %calltmp = call ptr @create_node(i32 0)
  store ptr %calltmp, ptr %merged, align 8
  %structptr = load ptr, ptr %module1, align 8
  %child1_ptr = getelementptr inbounds %ASTNode, ptr %structptr, i32 0, i32 5
  %child1 = load ptr, ptr %child1_ptr, align 8
  store ptr %child1, ptr %stmt_ptr, align 8
  br label %whilecond

whilecond:                                        ; preds = %ifcont31, %entry
  %stmt_ptr3 = load ptr, ptr %stmt_ptr, align 8
  %calltmp4 = call i32 @str_equals(ptr %stmt_ptr3, ptr @.str.504)
  %eqtmp = icmp eq i32 %calltmp4, 0
  br i1 %eqtmp, label %whilebody, label %afterwhile

whilebody:                                        ; preds = %whilecond
  %stmt_ptr5 = load ptr, ptr %stmt_ptr, align 8
  %calltmp6 = call ptr @ptr_to_node(ptr %stmt_ptr5)
  store ptr %calltmp6, ptr %stmt, align 8
  %structptr7 = load ptr, ptr %stmt, align 8
  %next_ptr = getelementptr inbounds %ASTNode, ptr %structptr7, i32 0, i32 8
  %next = load ptr, ptr %next_ptr, align 8
  store ptr %next, ptr %next_stmt, align 8
  %structptr8 = load ptr, ptr %stmt, align 8
  %fieldptr = getelementptr inbounds %ASTNode, ptr %structptr8, i32 0, i32 8
  store ptr @.str.505, ptr %fieldptr, align 8
  %structptr9 = load ptr, ptr %stmt, align 8
  %kind_ptr = getelementptr inbounds %ASTNode, ptr %structptr9, i32 0, i32 0
  %kind = load i32, ptr %kind_ptr, align 4
  %eqtmp10 = icmp eq i32 %kind, 1
  %ifcond = icmp ne i1 %eqtmp10, false
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %whilebody
  %base_dir11 = load ptr, ptr %base_dir2, align 8
  %structptr12 = load ptr, ptr %stmt, align 8
  %s1_ptr = getelementptr inbounds %ASTNode, ptr %structptr12, i32 0, i32 1
  %s1 = load ptr, ptr %s1_ptr, align 8
  %calltmp13 = call ptr @join_import_path(ptr %base_dir11, ptr %s1)
  store ptr %calltmp13, ptr %import_path, align 8
  %import_path14 = load ptr, ptr %import_path, align 8
  %calltmp15 = call ptr @read_file(ptr %import_path14)
  store ptr %calltmp15, ptr %import_content, align 8
  %import_content16 = load ptr, ptr %import_content, align 8
  %calltmp17 = call i32 @str_equals(ptr %import_content16, ptr @.str.506)
  %eqtmp18 = icmp eq i32 %calltmp17, 1
  %ifcond19 = icmp ne i1 %eqtmp18, false
  br i1 %ifcond19, label %then20, label %ifcont

then20:                                           ; preds = %then
  call void @print(ptr @.str.507)
  %import_path21 = load ptr, ptr %import_path, align 8
  call void @println(ptr %import_path21)
  call void @exit(i32 1)
  br label %ifcont

ifcont:                                           ; preds = %then20, %then
  %import_content22 = load ptr, ptr %import_content, align 8
  %calltmp23 = call ptr @parse_source(ptr %import_content22)
  store ptr %calltmp23, ptr %imported_module, align 8
  %imported_module24 = load ptr, ptr %imported_module, align 8
  %base_dir25 = load ptr, ptr %base_dir2, align 8
  %calltmp26 = call ptr @resolve_imports(ptr %imported_module24, ptr %base_dir25)
  store ptr %calltmp26, ptr %resolved_import, align 8
  %merged27 = load ptr, ptr %merged, align 8
  %resolved_import28 = load ptr, ptr %resolved_import, align 8
  call void @append_non_imports(ptr %merged27, ptr %resolved_import28)
  br label %ifcont31

else:                                             ; preds = %whilebody
  %merged29 = load ptr, ptr %merged, align 8
  %stmt30 = load ptr, ptr %stmt, align 8
  call void @append_statement(ptr %merged29, ptr %stmt30)
  br label %ifcont31

ifcont31:                                         ; preds = %else, %ifcont
  %next_stmt32 = load ptr, ptr %next_stmt, align 8
  store ptr %next_stmt32, ptr %stmt_ptr, align 8
  br label %whilecond

afterwhile:                                       ; preds = %whilecond
  %merged33 = load ptr, ptr %merged, align 8
  ret ptr %merged33
}

define i32 @main() {
entry:
  %merged_ast = alloca ptr, align 8
  %base_dir = alloca ptr, align 8
  %ast_root = alloca ptr, align 8
  %p = alloca ptr, align 8
  %head_token = alloca ptr, align 8
  %lex = alloca ptr, align 8
  %content = alloca ptr, align 8
  %out_file = alloca ptr, align 8
  %path = alloca ptr, align 8
  call void @println(ptr @.str.508)
  store ptr @.str.509, ptr %path, align 8
  store ptr @.str.510, ptr %out_file, align 8
  %calltmp = call i32 @cli_arg_count()
  %gttmp = icmp sgt i32 %calltmp, 1
  %ifcond = icmp ne i1 %gttmp, false
  br i1 %ifcond, label %then, label %ifcont

then:                                             ; preds = %entry
  %calltmp1 = call ptr @cli_arg(i32 1)
  store ptr %calltmp1, ptr %path, align 8
  br label %ifcont

ifcont:                                           ; preds = %then, %entry
  %calltmp2 = call i32 @cli_arg_count()
  %gttmp3 = icmp sgt i32 %calltmp2, 2
  %ifcond4 = icmp ne i1 %gttmp3, false
  br i1 %ifcond4, label %then5, label %ifcont7

then5:                                            ; preds = %ifcont
  %calltmp6 = call ptr @cli_arg(i32 2)
  store ptr %calltmp6, ptr %out_file, align 8
  br label %ifcont7

ifcont7:                                          ; preds = %then5, %ifcont
  %path8 = load ptr, ptr %path, align 8
  %calltmp9 = call ptr @read_file(ptr %path8)
  store ptr %calltmp9, ptr %content, align 8
  %content10 = load ptr, ptr %content, align 8
  %calltmp11 = call i32 @str_equals(ptr %content10, ptr @.str.511)
  %eqtmp = icmp eq i32 %calltmp11, 1
  %ifcond12 = icmp ne i1 %eqtmp, false
  br i1 %ifcond12, label %then13, label %ifcont14

then13:                                           ; preds = %ifcont7
  call void @println(ptr @.str.512)
  ret i32 1

ifcont14:                                         ; preds = %ifcont7
  call void @println(ptr @.str.513)
  %content15 = load ptr, ptr %content, align 8
  call void @println(ptr %content15)
  %content16 = load ptr, ptr %content, align 8
  %calltmp17 = call ptr @create_lexer(ptr %content16)
  store ptr %calltmp17, ptr %lex, align 8
  %lex18 = load ptr, ptr %lex, align 8
  %calltmp19 = call ptr @lex_all_tokens(ptr %lex18)
  store ptr %calltmp19, ptr %head_token, align 8
  call void @println(ptr @.str.514)
  %head_token20 = load ptr, ptr %head_token, align 8
  %calltmp21 = call ptr @parser_create(ptr %head_token20)
  store ptr %calltmp21, ptr %p, align 8
  %p22 = load ptr, ptr %p, align 8
  %calltmp23 = call ptr @parse_module(ptr %p22)
  store ptr %calltmp23, ptr %ast_root, align 8
  call void @println(ptr @.str.515)
  %path24 = load ptr, ptr %path, align 8
  %calltmp25 = call ptr @get_directory(ptr %path24)
  store ptr %calltmp25, ptr %base_dir, align 8
  %ast_root26 = load ptr, ptr %ast_root, align 8
  %base_dir27 = load ptr, ptr %base_dir, align 8
  %calltmp28 = call ptr @resolve_imports(ptr %ast_root26, ptr %base_dir27)
  store ptr %calltmp28, ptr %merged_ast, align 8
  call void @println(ptr @.str.516)
  call void @ir_reset()
  %merged_ast29 = load ptr, ptr %merged_ast, align 8
  call void @generate_module(ptr %merged_ast29)
  call void @ir_print()
  %out_file30 = load ptr, ptr %out_file, align 8
  %calltmp31 = call i32 @ir_write_file(ptr %out_file30)
  call void @print(ptr @.str.517)
  %out_file32 = load ptr, ptr %out_file, align 8
  call void @println(ptr %out_file32)
  call void @println(ptr @.str.518)
  ret i32 0
}
