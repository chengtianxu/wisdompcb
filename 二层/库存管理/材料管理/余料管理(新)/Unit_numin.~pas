unit Unit_numin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ComCtrls, Buttons;

type
  TForm_numin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Label9: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Edit10: TEdit;
    DBGrid1: TDBGrid;
    Label15: TLabel;
    dt1: TDateTimePicker;
    BitBtn5: TBitBtn;
    Label16: TLabel;
    Label17: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_numin: TForm_numin;

implementation
uses damo,Unit_inser2,Pick_Item_Single2,ConstVar,common;

{$R *.dfm}

procedure TForm_numin.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_numin.Button1Click(Sender: TObject);
begin
 {if strtofloat(edit5.text)>Form_inser2.DBGrid1.DataSource.DataSet.FieldByName('QUANTITY').value then
  begin
   showmessage('输入仓数量不能大于选择该材料编码的发放数量！');
   edit5.setfocus;
   exit;
  end; }

 {if strtofloat(edit5.text)<=0 then
  begin
   showmessage('请输入入仓数量！');
   edit5.setfocus;
   exit;
  end;  }

 {
 if strtofloat(Edit6.text)<=0 then
  begin
   showmessage('请输入价格！');
   edit5.setfocus;
   exit;
  end; }

 modalresult:=mrok;
end;

procedure TForm_numin.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm_numin.DBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
      edit7.Text:=dm.detail207QUANTITY.AsString;
      Edit10.Text:=dm.detail207.FieldByName('供应商简称').AsString+
               dm.detail207.FieldByName('SUPPLIER2').AsString+':'+
               dm.detail207.FieldByName('BARCODE_ID').AsString;      //备注
      dt1.DateTime:=StrToDateTime(FormatDateTime('yyyy-mm-dd',dm.detail207.fieldbyname('EXPIRE_DATE').Value)) ;  //有效期
end;

procedure TForm_numin.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  edit7.Text:=dm.detail207QUANTITY.AsString;
  Edit10.Text:=dm.detail207.FieldByName('供应商简称').AsString+
               dm.detail207.FieldByName('SUPPLIER2').AsString+':'+
               dm.detail207.FieldByName('BARCODE_ID').AsString;      //备注
  dt1.DateTime:=StrToDateTime(FormatDateTime('yyyy-mm-dd',dm.detail207.fieldbyname('EXPIRE_DATE').Value)) ;  //有效期
end;

procedure TForm_numin.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm_numin.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm_numin.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  try
    frmPick_Item_Single2 := TfrmPick_Item_Single2.Create(application) ;
    InputVar.Fields := 'CODE/供应商代码/110,SUPPLIER_NAME/供应商名称/351,'+
                        'ABBR_NAME/简称/80';
    InputVar.Sqlstr :=
    'SELECT TOP 100 PERCENT Data0023.CODE, Data0023.SUPPLIER_NAME,'+#13+
    'Data0023.ABBR_NAME, Data0023.RKEY'+#13+
    'FROM         dbo.Data0023'+#13+
    'WHERE  (dbo.Data0023.ttype in(0,2) )'+#13+
    'ORDER BY Data0023.CODE';

    inputvar.InPut_value:=Edit8.Text;
    inputvar.KeyField:='CODE';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single2.InitForm_New(InputVar);
    if frmPick_Item_Single2.ShowModal=mrok then
     begin
       Edit8.Text:=frmPick_Item_Single2.adsPick1.Fieldbyname('code').AsString;
       Label16.Caption:=frmPick_Item_Single2.adsPick1.Fieldbyname('ABBR_NAME').AsString;
       Label17.Caption:=IntToStr(frmPick_Item_Single2.adsPick1.Fieldbyname('rkey').AsInteger);
     end;
  finally
      frmPick_Item_Single2.adsPick1.Close;
      frmPick_Item_Single2.Free ;
  end;
end;

end.
