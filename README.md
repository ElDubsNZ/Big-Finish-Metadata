# Big Finish Metadata

## Overview

This repository is aimed at collectors of Big Finish Audios who would like a consistent and convenient folder structure with which to store all your audios.

I created this intending on using it with audiobookshelf, a self-hosted audiobook player, however it should work with anything that supports opf files.

## Corrections

The source folder structure was copied from another collector, it may have errors, I will update this repository as time goes on with a "corrections" powershell script that will automatically rename files from how they were originally named to the correct name where needed.

Please log any corrections needed under issues.

## Cover Art

I would love to include cover art, but I'm not certain of the copyright status and don't want to risk github taking the repository down, so you'll need to source this yourself.

I highly recommend using the custom metadata provider at https://www.audiobookshelf.org/guides/custom-metadata-providers/.

This collects the cover art for you. It will also do metadata as well, but the metadata is a little less refined than the manual work I've done on mine.

Use both, just put OPF at the top of your Scanner priority list in audiobookshelf so it'll get the scraped metadata where you don't have an .opf yet.

## Folder Structure

The collector I got the folder structure from kept audio files for a full season in the same folder, however audiobookshelf requires these to be separate.

Another issue is Windows has issues with file path lengths over 260 characters.

So I've created a script that fixes this, and shifts all files within a directory (and all nested sub-directories) into their own folders.

If you need this, run the "MoveFilesDown" script in the Scripts folder.

**IMPORTANT**: Run this *before* you copy across the OPF files otherwise they'll get placed in an even further sub-directory.