package com.videoshare.po;

public class Collect {

    private int id;
    private int video_id;
    private int collector_id;

    private Video video;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVideo_id() {
        return video_id;
    }

    public void setVideo_id(int video_id) {
        this.video_id = video_id;
    }

    public int getCollector_id() {
        return collector_id;
    }

    public void setCollector_id(int collector_id) {
        this.collector_id = collector_id;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "id=" + id +
                ", video_id=" + video_id +
                ", collector_id=" + collector_id +
                ", video=" + video +
                '}';
    }
}
