import ballerina/file;
import ballerina/io;

public function main() returns error? {

    // Creates a new directory with any non-existent parents.
    string dirPath = check file:joinPath("foo", "bar");
    check file:createDir(dirPath, file:RECURSIVE);
    io:println("The " + dirPath + " directory created successfully.");

    // Checks whether the directory of the provided path exists.
    boolean fileExists = check file:test("foo", file:EXISTS);
    io:println("Is foo directory exist: ", fileExists.toString());

    // Copies the directory to the new path.
    check file:copy(dirPath, "test", file:REPLACE_EXISTING);
    io:println("The " + dirPath + " directory copied successfully.");

    // Renames the directory to the new path.
    check file:rename("foo", "test1");
    io:println("The foo directory renamed successfully.");

    // Gets the list of files in the directory.
    file:MetaData[] readDirResults = check file:readDir("test1");
    io:println("Directory path: ", readDirResults[0].absPath);
    io:println("Directory size: ", readDirResults[0].size.toString());
    io:println("Is directory: ", readDirResults[0].dir.toString());
    io:println("Modified at ", readDirResults[0].modifiedTime.toString());

    // Removes the file or directory in the specified file path.
    check file:remove("test");

    // Removes the directory in the specified file path with all its children.
    check file:remove("test1", file:RECURSIVE);
    io:println("Directories removed successfully.");
}
