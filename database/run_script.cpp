    #include<mysql/mysql.h>
   #include <stdlib.h>
   #include <cstring> 
   #include <iostream>
#include <stdio.h>
#include <string.h>
#include <string.h>
 
  /*extern "C" bool run_script_init(UDF_INIT *initid, UDF_ARGS *args, char *message) {
  size_t length = 0;
  /*for (unsigned int i = 0; i < args->arg_count; i++) {
    if (args->arg_type[i] != STRING_RESULT) {
      strcpy(message, "This UDF accepts only string arguments.");
      return true;
    }
    length += args->lengths[i];
  }
  initid->ptr = new char[312];
  initid->max_length = length;
  initid->maybe_null = 1; 
  return false;
}*/
 
 /*extern "C" char *run_script(UDF_INIT *initid, UDF_ARGS *args, char *result,
                  unsigned long *length, unsigned char *is_null,
                  unsigned char *error)*/
                  
  long long xxx(UDF_INIT *initid, UDF_ARGS *args,
              char *is_null, char *error);{
    //char *add  = new char[129999];
   
  /* result = initid->ptr;
  *is_null = 0;
  *error = 0;

  FILE *fp;
  char path[1035];

  /* Open the command for reading. 
  fp = popen( args->args[0], "r");
  if (fp == NULL) {
    printf("Failed to run command\n" );
    exit(1);
  }

  /* Read the output a line at a time - output it.  
  while (fgets(path, sizeof(path), fp) != NULL) {
      strcat(add,path);

  }
  /* close 
   strcpy(result,add);
  pclose(fp);
  *length = strlen(result);*/
  // system(args->args[0])
  return system(args->args[0]);
}
/*
extern "C"  void run_script_deinit(UDF_INIT *initid) { delete[] initid->ptr; }
  
*/

//https://askubuntu.com/questions/250910/cross-compilation-issues-with-gcc-g