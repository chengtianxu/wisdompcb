unit Unit_catser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TForm_catser = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    DataSource1: TDataSource;
    adoquery1: TADOQuery;
    adoquery1INV_PART_NUMBER: TStringField;
    adoquery1INV_NAME: TStringField;
    adoquery1INV_DESCRIPTION: TStringField;
    adoquery1rkey: TIntegerField;
    adoquery1UNIT_NAME: TStringField;
    adoquery1ABBR_NAME: TStringField;
    procedure N8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
  field_name:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_catser: TForm_catser;

implementation

uses damo, remain_form2, Unit_numin;
{$R *.dfm}

procedure TForm_catser.N8Click(Sender: TObject);
begin
//modalresult:=mrok;
try
 form_numin:=tform_numin.Create(application);
 form_numin.Width:=760;
 with form_numin do
 begin
  edit1.Text:=Form_catser.adoquery1INV_PART_NUMBER.Value;
  edit2.Text:=Form_catser.adoquery1INV_DESCRIPTION.Value;
  edit9.Text:=Form_catser.adoquery1UNIT_NAME.Value;
  edit8.Text:=Form_catser.adoquery1ABBR_NAME.Value;
  Label10.Enabled:=False;
  Edit7.Enabled:=False;
  Label11.visible:=True;
  Edit8.visible:=True;
 

  Label9.visible:=False;
  Edit6.visible:=False;


  Label15.visible:=False;
  dt1.visible:=False;
  DBGrid1.visible:=False;


  //edit6.Text:=dm.ADOQuery1rkey.Value;
  //edit3.Text:=dm.ADO556LEN_SIZE.AsString;
  //edit4.Text:=dm.ADO556WEI_SIZE.AsString;
  edit2.ReadOnly:=true;
  //edit3.ReadOnly:=true;
  //edit4.ReadOnly:=true;
 end;
 if form_numin.ShowModal=mrok then
 begin
  if(form_remain2.SGrid1.RowCount>=2) and (trim(form_remain2.SGrid1.Cells[0,1])<>'')  then
   begin
    form_remain2.SGrid1.RowCount:=form_remain2.SGrid1.RowCount+1;
    form_remain2.SGrid2.RowCount:=form_remain2.SGrid2.RowCount+1;
   end;

   with form_remain2 do
   begin
    Edit2.Text:=form_numin.Edit10.Text;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=form_numin.Edit1.Text;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=form_numin.Edit2.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=form_numin.Edit3.Text ;
    sgrid1.Cells[3,sgrid1.RowCount-1]:=form_numin.Edit4.Text ;
    sgrid1.Cells[4,sgrid1.RowCount-1]:=form_numin.Edit5.Text ;
    //sgrid1.Cells[5,sgrid1.RowCount-1]:=form_numin.Edit6.Text ;    //价格
   // sgrid1.Cells[6,sgrid1.RowCount-1]:=dm.ADOQuery1.fieldbyname('供应商简称').Value ;    //供应商
    sgrid1.Cells[5,sgrid1.RowCount-1]:=form_numin.Edit8.Text;                                    //供应商
    sgrid1.Cells[6,sgrid1.RowCount-1]:=form_numin.Edit9.Text ;  //单位
    sgrid1.Cells[7,sgrid1.RowCount-1]:=form_numin.Edit10.Text ;  //备注
    sgrid1.Cells[8,sgrid1.RowCount-1]:=form_numin.label17.Caption;  //SUPP_PTR
    sgrid2.Cells[0,sgrid1.RowCount-1]:=Self.ADOQuery1rkey.AsString;
   end;
 
 end;
finally
form_numin.Free;
end;
close;
end;

procedure TForm_catser.BitBtn1Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_catser.BitBtn2Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_catser.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 field_name:='inv_part_number';
end;

procedure TForm_catser.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  self.adoquery1.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  adoquery1.Filter := '';
end;

procedure TForm_catser.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (field_name<>column.FieldName)and (column.ReadOnly)  then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;

end;

end.
