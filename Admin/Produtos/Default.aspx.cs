using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_Produtos_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void frmEditar_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        grdProdutos.DataBind();
    }
    protected void grdProdutos_SelectedIndexChanged(object sender, EventArgs e)
    {
        winEditar.Hide = false;
    }
    protected void frmEditar_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        winEditar.Hide = true;
    }
    protected void frmAdicionar_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        winAdicionar.Hide = true;

        salvarImagem();
    }

    private void salvarImagem()
    {
        FileUpload upload = (FileUpload)frmAdicionar.FindControl("fuImagem");

        String caminho = Server.MapPath("~/Imagens/" + upload.FileName);

        if (!File.Exists(caminho))
        {
            if (upload.HasFile)
                try
                {

                    upload.SaveAs(caminho);


                    #region Imagem Maior
                    using (Bitmap bitmap = new Bitmap(upload.PostedFile.InputStream, false))
                        if (bitmap.Width > bitmap.Height)
                        {
                            int wi = bitmap.Width;
                            int he = bitmap.Height;
                            int novaAltura = (wi * 140) / he;
                            CriarThumbnail(140, novaAltura, caminho, Server.MapPath("~/Imagens/Thumb424/" + upload.FileName));


                        }
                        else
                        {
                            int he = bitmap.Height;
                            int wi = bitmap.Width;
                            int novaLargura = (wi * 139) / he;
                            CriarThumbnail(novaLargura, 139, caminho, Server.MapPath("~/Imagens/Thumb424/" + upload.FileName));
                        }
                    #endregion

                    #region Imagem Menor
                    using (Bitmap bitmap = new Bitmap(upload.PostedFile.InputStream, false))
                        if (bitmap.Width > bitmap.Height)
                        {
                            int wi = bitmap.Width;
                            int he = bitmap.Height;
                            int novaAltura = (he * 65) / wi;
                            CriarThumbnail(65, novaAltura, caminho, Server.MapPath("~/Imagens/Thumb65/" + upload.FileName));

                        }
                        else
                        {
                            int he = bitmap.Height;
                            int wi = bitmap.Width;
                            int novaLargura = (wi * 65) / he;
                            CriarThumbnail(novaLargura, 65, caminho, Server.MapPath("~/Imagens/Thumb65/" + upload.FileName));
                        }
                    #endregion

                }
                catch (Exception ex)
                {
                    Response.Write("ERRO: " + ex);
                }
        }

    }

    public void CriarThumbnail(int largura, int altura, string srcpath, string destpath)
    {
        System.Drawing.Image img = System.Drawing.Image.FromFile(srcpath);
        System.Drawing.Image imgthumb = img.GetThumbnailImage(largura, altura, null, new System.IntPtr(0));
        imgthumb.Save(destpath, ImageFormat.Jpeg);
        img.Dispose();
        imgthumb.Dispose();
    }
}
