package com.example.project_4.common;

import com.example.project_4.bean.BoardVO;
import com.example.project_4.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {

    public BoardVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();
        BoardVO one = null;

        MultipartRequest multipartRequest = null;

        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit,
                    "utf-8", new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("image");
            one = new BoardVO();

            String seq = multipartRequest.getParameter("seq");
            System.out.println(seq);
            if(seq != null && !seq.equals("")) one.setSeq(Integer.parseInt(seq));
            one.setCategory(multipartRequest.getParameter("category"));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));

            if(seq != null && !seq.equals("")) {
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(seq));
                System.out.println("old: " + oldfilename);
                if(filename != null && oldfilename != null)
                    FileUpload.deleteFile(request, oldfilename);
                else if(filename == null && oldfilename != null)
                    filename = oldfilename;
            }
            one.setPhoto(filename);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");
        System.out.println(filePath);

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }

}
