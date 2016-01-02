/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package temp.model;

/**
 *
 * @author Manav
 */
public class ModelNotice {

    private String title;
    private String news;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNews() {
        return news;
    }

    public void setNews(String news) {
        this.news = news;
    }

    public boolean noticeUpload() {
        DB_Connect dbcon = new DB_Connect();
        int i = 0;
      
        try {
            dbcon.st = dbcon.con.prepareStatement("insert into notice (title,news) VALUES (?,?)");

            dbcon.st.setString(1, getTitle());
            dbcon.st.setString(2, getNews());
            i = dbcon.st.executeUpdate();

            if (i > 0) {
                return true;

            } else {
                return false;

            }

        } catch (Exception ex) {
            return false;
        }

    }

}
