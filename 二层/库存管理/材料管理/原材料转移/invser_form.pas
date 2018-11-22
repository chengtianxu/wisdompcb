unit invser_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB,
  ADODB;

type
  TForm_invser = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    field_name :string;
  public
    { Public declarations }
  end;

var
  Form_invser: TForm_invser;

implementation

uses main,damo,outnum_form;
{$R *.dfm}

procedure TForm_invser.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>dm.ADOData22.IndexFieldNames) then
 dm.ADOData22.IndexFieldNames:=column.FieldName;

if (field_name<>column.FieldName)and (column.ReadOnly)  then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;

end;

procedure TForm_invser.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.ADOdata22.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ADOdata22.filter := '';
end;

procedure TForm_invser.BitBtn3Click(Sender: TObject);
begin
 edit1.Clear;
 edit1.SetFocus;
end;

procedure TForm_invser.BitBtn2Click(Sender: TObject);
begin
 try
 form_outnum:=tform_outnum.Create(application);
  with form_outnum do
  begin
   edit1.Text:=dm.ADOData22QUAN_ON_HAND.AsString;
   edit2.Text:=dm.ADOData22UNIT_NAME.Value;
   edit3.Text:=dm.ADOData22QUAN_ON_HAND.AsString;
  end;

 if form_outnum.ShowModal=mrok then
  begin
   if (dm.ADOData22EXPIRE_DATE.Value>=Strtodatetime(form1.sys_longdate)) or (dm.ADOData22EXPIRE_DATE.Value=0)  then
    with form1 do
    begin
     if sgrid1.RowCount=2 then
      begin
       edit2.Text:=dm.ADOData22SUPPLIER_NAME.Value;
       edit3.Text:=dm.ADOData22CURR_NAME.Value;
       key23.caption:=dm.ADOData22key23.AsString;
       key01.caption:=dm.ADOData22key01.AsString;
 //====================查找data0456中的汇率记录=====================
       edit5.Text:=dm.ADOData22EXCHANGE_RATE.AsString;
//=====================记录data0456的入仓单号=======================
      with dm.ADO04 do
       begin
        open;
        edit4.Text:=dm.ADO04SEED_VALUE.Value;
        close;
       end;

      sgrid1.Cells[0,sgrid1.RowCount-1]:=form_outnum.Edit3.Text;
      sgrid1.Cells[1,sgrid1.RowCount-1]:=dm.ADOData22UNIT_NAME.Value;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=dm.ADOData22price.AsString;
      sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.ADOData22INV_DESCRIPTION.Value;
      sgrid1.Cells[4,sgrid1.RowCount-1]:=dm.ADOData22INV_NAME.Value;
   //   sgrid1.Cells[5,sgrid1.RowCount-1]:=dm.ADOData22LOCATION.Value;
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADOData22RKEY.AsString;
      sgrid2.Cells[1,sgrid2.RowCount-1]:=dm.ADOData22GRN_PTR.AsString;
      sgrid2.Cells[2,sgrid2.RowCount-1]:=dm.ADOData22QUAN_ON_HAND.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      dm.ADOData22.Delete;
     end
//=================== 只有同一工厂，同一供应商，同一货币的产品才能入仓================
   else
      if  not ((edit2.Text=dm.ADOData22SUPPLIER_NAME.Value)
               and (edit3.Text=dm.ADOData22CURR_NAME.Value)
               and (edit5.Text=dm.ADOData22EXCHANGE_RATE.AsString))then
      begin
      if edit3.Text<>dm.ADOData22CURR_NAME.Value  then
      messagedlg('请检查货币是否和已选择材料的货币相同！',mtinformation,[mbcancel],0)
     else
      if edit2.Text<>dm.ADOData22SUPPLIER_NAME.Value then
       messagedlg('请检查供应商是否和已选择材料的供应商相同！',mtinformation,[mbcancel],0)
     else
      if edit5.Text<>dm.ADOData22EXCHANGE_RATE.AsString then
       messagedlg('请检查汇率是否和已选择材料的汇率相同！',mtinformation,[mbcancel],0);
      end
    else
     begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=form_outnum.Edit3.Text;
      sgrid1.Cells[1,sgrid1.RowCount-1]:=dm.ADOData22UNIT_NAME.Value;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=dm.ADOData22price.AsString;
      sgrid1.Cells[3,sgrid1.RowCount-1]:=dm.ADOData22INV_DESCRIPTION.Value;
      sgrid1.Cells[4,sgrid1.RowCount-1]:=dm.ADOData22INV_NAME.Value;
    //  sgrid1.Cells[5,sgrid1.RowCount-1]:=dm.ADOData22LOCATION.Value;
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADOData22RKEY.AsString;
      sgrid2.Cells[1,sgrid2.RowCount-1]:=dm.ADOData22GRN_PTR.AsString;
      sgrid2.Cells[2,sgrid2.RowCount-1]:=dm.ADOData22QUAN_ON_HAND.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      dm.ADOData22.Delete;
     end;
   end  //   对应 with form1 语句
 else
    messagedlg('该批物料有效期已过，请到来料检查模块重新确定有效期！',mtconfirmation,[mbok],0);
  end;    //   if form_outnum.ShowModal=mrok 语句
 finally
 form_outnum.Free;
 end ;
end;

procedure TForm_invser.FormCreate(Sender: TObject);
begin
 field_name:='INV_PART_NUMBER';
end;

end.
