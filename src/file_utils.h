#ifndef FILEUTILS_GUARD
#define FILEUTILS_GUARD

bool file_exists(const std::string& name);
bool filepath_exists(const std::string& name);
bool can_write(std::string filename, bool overwrite, std::string &msg);
std::string getFileExt(const std::string& s);
std::string setFileExt(const std::string& s, const std::string& ext);
std::string basename(std::string filename);
std::string basename_noext(std::string filename);
std::string noext(std::string filename);
std::string tempFile(std::string tmpdir, unsigned pid, std::string ext);
std::string dirname(std::string filename);
bool write_text(std::string filename, std::vector<std::string> s);
std::vector<std::string> read_text(std::string filename);

#endif

