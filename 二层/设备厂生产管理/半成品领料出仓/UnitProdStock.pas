unit UnitProdStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFrmProdStock = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdStock: TFrmProdStock;

implementation

{$R *.dfm}
uses
  UnitDataModal, UnitPutOutDetail, UnitPutOut;

procedure TFrmProdStock.DBGrid1DblClick(Sender: TObject);
begin
  if not dm.ads08.IsEmpty then
    button1.OnClick(sender);
end;

procedure TFrmProdStock.Button1Click(Sender: TObject);
begin
  FrmPutoutDetail := TFrmPutoutDetail.Create(Application);

  with FrmPutoutDetail do
  begin
    edit1.Text:=dm.ads08qty_on_hand_01.AsString;
    edit2.Text:=dm.ads08UNIT_NAME.Value;
    checkbox1.Visible:=true;
    label4.Visible:=true;
    edit4.Visible:=true;
    label5.Visible:=True;
    edit5.Visible:=True;    

//2014-09-04tang-----------------------
//    edtremark.Text:=DM.ads492_468CUT_NO.AsString;
//2014-10-11tang重新修改为工程编号对应的投产生产单号为默认
    dm.Ado492.Close;
    DM.Ado492.Parameters.ParamByName('PROD_CODE').Value:=dm.ads08PROD_CODE.AsString;
    DM.Ado492.Open;
    if (not DM.Ado492.IsEmpty) then
    edtremark.Text:=DM.Ado492.FieldByName('CUT_NO').AsString;
//end tang-----------------------------

    edit4.Text:=dm.ads492_468QUAN_BOM.AsString;
    edit5.Text:=dm.ads492_468QUAN_ISSUED.AsString;
    if dm.ads492_468QUAN_BOM.Value-dm.ads492_468QUAN_ISSUED.Value>0 then
      if dm.ads492_468QUAN_BOM.Value-DM.ads492_468QUAN_ISSUED.Value<
        dm.ads08qty_on_hand_01.Value then
        edit3.Text:=formatfloat
             ('0.00',DM.ads492_468QUAN_BOM.value-dm.ads492_468QUAN_ISSUED.Value)
      else
        edit3.Text:=DM.ads08qty_on_hand_01.AsString
    else
      edit3.Text:='0';
  end;

  if FrmPutoutDetail.ShowModal=mrok then
  begin
    with FrmPutout do
    begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=DM.ads08PROD_CODE.Value;
      sgrid1.Cells[1,sgrid1.RowCount-1]:=dm.ads08PRODUCT_NAME.Value;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=dm.ads08PRODUCT_DESC.Value;
      sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.ads08LOCATION.Value;
      sgrid1.Cells[4,sgrid1.RowCount-1]:=dm.ads08UNIT_NAME.Value;
      sgrid1.Cells[5,sgrid1.RowCount-1]:=FrmPutoutDetail.Edit3.Text;
      SGrid1.Cells[6,SGrid1.RowCount-1]:=FrmPutoutDetail.edtremark.Text;

      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ads08RKEY08.AsString;
      sgrid2.Cells[1,sgrid2.RowCount-1]:=DM.ads08RKEY16.AsString;
      sgrid2.Cells[2,sgrid2.RowCount-1]:=dm.ads492_468RKEY468.AsString;
      sgrid2.Cells[3,sgrid2.RowCount-1]:=DM.ads08RKEY01.AsString;

      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      dm.ads08.Edit;
      dm.ads08qty_on_hand_01.Value:=dm.ads08qty_on_hand_01.Value-
                                 strtocurr(FrmPutoutDetail.edit3.Text);
      dm.ads08.Post;

      dm.ads492_468.Edit;
      dm.ads492_468QUAN_ISSUED.Value:=dm.ads492_468QUAN_ISSUED.Value+
                               strtocurr(FrmPutoutDetail.edit3.Text);

      if (FrmPutoutDetail.CheckBox1.Checked) or
         (dm.ads492_468QUAN_ISSUED.Value>=dm.ads492_468QUAN_BOM.Value) then
        dm.ads492_468STATUS.Value:=1;
      dm.ads492_468.Post;
    end;

    ModalResult:=mrok;
  end;

  FrmPutoutDetail.free;
end;

end.

