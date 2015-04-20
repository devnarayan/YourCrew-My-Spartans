using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
/// <summary>
/// Summary description for FileUploader
/// </summary>
public class FileUploader
{
    ErrorHandling erH = new ErrorHandling();

    HttpPostedFile uploadedImage;
    int maxAllowedSize, imageSize;
    string imageName, imagePath, fileExtn;
    bool chk = false;

    public string Upload(FileUpload imageFU, double allowedSize, string imageNamePrefix, string imageLocation, string[] ext)
    {

        uploadedImage = imageFU.PostedFile;
        imageSize = uploadedImage.ContentLength;

        if (uploadedImage != null)
        {
            maxAllowedSize = Convert.ToInt32(allowedSize * 1000000);

            if (0 < imageSize && imageSize <= maxAllowedSize)
            {
                if (ext.Contains(Path.GetExtension(imageFU.PostedFile.FileName)))
                {
                    imageName = Path.GetFileName(uploadedImage.FileName);
                    imageName = imageName.ToLower();
                    if (imageName.Contains("jpg"))
                        fileExtn = ".jpg";
                    if (imageName.Contains("jpeg"))
                        fileExtn = ".jpeg";
                    if (imageName.Contains("png"))
                        fileExtn = ".png";
                    if (imageName.Contains("gif"))
                        fileExtn = ".gif";

                    imageName = imageNamePrefix + fileExtn;
                    imagePath = imageLocation + imageName;
                    try
                    {
                        uploadedImage.SaveAs(HttpContext.Current.Server.MapPath(imagePath));
                    }
                    catch (HttpException)
                    {

                    }
                    catch (Exception ex)
                    {
                        erH.ShowError(ex);
                    }
                }
                else
                {
                    HttpContext.Current.Session["errorMsg"] = (Path.GetExtension(imageFU.PostedFile.FileName)).ToString() + " Extension Not Allowed.";
                    HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.ToString(),false);
                }
            }

            else
            {
                HttpContext.Current.Session["errorMsg"] = "Images size exceeded ! Maximum allowed size is 1.5 MB.";
                HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.ToString());
            }
            //if (uploadedImage.ContentType.ToLower() == "image/jpeg" || uploadedImage.ContentType.ToLower() == "image/jpg" || uploadedImage.ContentType.ToLower() == "image/x-png" || uploadedImage.ContentType.ToLower() == "image/png")
            //{

            //}

        }

        return imagePath;
    }

    // ******************************** uploadImage method is used to upload the jpg/jpeg/png images of maximum allowed size on a custom location *******

    public string uploadImage(FileUpload imageFU, double allowedSize, string imageNamePrefix, string imageLocation)
    {
        uploadedImage = imageFU.PostedFile;
        imageSize = uploadedImage.ContentLength;

        if (uploadedImage != null)
        {
            maxAllowedSize = Convert.ToInt32(allowedSize * 1000000);

            if (0 < imageSize && imageSize <= maxAllowedSize)
            {
                if (uploadedImage.ContentType.ToLower() == "image/jpeg" || uploadedImage.ContentType.ToLower() == "image/jpg" || uploadedImage.ContentType.ToLower() == "image/x-png" || uploadedImage.ContentType.ToLower() == "image/png")
                {
                    imageName = Path.GetFileName(uploadedImage.FileName);
                    imageName = imageName.ToLower();
                    if (imageName.Contains("jpg"))
                        fileExtn = ".jpg";
                    if (imageName.Contains("jpeg"))
                        fileExtn = ".jpeg";
                    if (imageName.Contains("png"))
                        fileExtn = ".png";

                    imageName = imageNamePrefix + fileExtn;
                    imagePath = imageLocation + imageName;
                    try
                    {
                        uploadedImage.SaveAs(HttpContext.Current.Server.MapPath(imagePath));
                    }
                    catch (HttpException)
                    {

                    }
                    catch (Exception ex)
                    {
                        erH.ShowError(ex);
                    }
                }
                else
                {
                    HttpContext.Current.Session["errorMsg"] = "Only 'JPG/JPEG' & 'PNG' images are allowed.";
                    HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.ToString());
                }
            }
            else
            {
                HttpContext.Current.Session["errorMsg"] = "Images size exceeded ! Maximum allowed size is 1.5 MB.";
                HttpContext.Current.Response.Redirect(HttpContext.Current.Request.Url.ToString());
            }
        }
        return imagePath;
    }

    // ******************************** end uploadImage method *******
}