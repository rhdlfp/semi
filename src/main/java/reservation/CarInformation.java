package reservation;

public class CarInformation {
    private int carID;
    private String carName;
    private int carPrice;
    private String carDescription;
    private String startPoint;
    private boolean rentalAvailable;
    private String carImage;
    

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public int getCarPrice() {
        return carPrice;
    }

    public void setCarPrice(int carPrice) {
        this.carPrice = carPrice;
    }

    public String getCarDescription() {
        return carDescription;
    }

    public void setCarDescription(String carDescription) {
        this.carDescription = carDescription;
    }

    public String getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(String startPoint) {
        this.startPoint = startPoint;
    }

    public boolean isRentalAvailable() {
        return rentalAvailable;
    }

    public void setRentalAvailable(boolean rentalAvailable) {
        this.rentalAvailable = rentalAvailable;
    }
    
    public String getCarImage() {
        return carImage;
    }

    public void setCarImage(String carImage) {
        this.carImage = carImage;
    }
}
