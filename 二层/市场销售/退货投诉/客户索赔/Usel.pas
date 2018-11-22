unit Usel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus;

type
  TForm_sel = class(TForm)
    Panel5: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ListBox1: TListBox;
    Edit9: TEdit;
    BitBtn7: TBitBtn;
    Button3: TButton;
    Button4: TButton;
    StringGrid1: TStringGrid;
    BitBtn8: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BitBtn7Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure update_sgrid(sgrid_row:byte);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    sSql:string;
    v_Field_List_CN,v_Field_List_EN:Variant;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_sel: TForm_sel;

implementation

uses ConstVar,Pick_Item_Single,common, Udemo;

{$R *.dfm}
procedure TForm_sel.update_sgrid(sgrid_row: byte);
begin
 StringGrid1.Cells[0,sgrid_row]:=listbox1.Items[listbox1.itemindex];
 StringGrid1.Cells[1,sgrid_row]:=edit9.Text;
 case listbox1.ItemIndex of
  0:
  if RadioGroup2.ItemIndex=0 then
    StringGrid1.Cells[2,sgrid_row]:=' and spNumber= '''+edit9.Text+''''
  else
    StringGrid1.Cells[2,sgrid_row]:=' and spNumber LIKE ''%'+edit9.Text+'%''';
  1:
  if RadioGroup2.ItemIndex=0 then
    StringGrid1.Cells[2,sgrid_row]:=' and data0010.ABBR_NAME = '''+edit9.Text+''''
  else
    StringGrid1.Cells[2,sgrid_row]:=' and data0010.ABBR_NAME LIKE ''%'+edit9.Text+'%''';
  2:
  if RadioGroup2.ItemIndex=0 then
   StringGrid1.Cells[2,sgrid_row]:= 'and USER_FULL_NAME = '''+edit9.Text+''''
  else
   StringGrid1.Cells[2,sgrid_row]:=' and USER_FULL_NAME LIKE ''%'+edit9.Text+'%''';
  3:
  if RadioGroup2.ItemIndex=0 then
   StringGrid1.Cells[2,sgrid_row]:=' and  data0015.ABBR_NAME = '''+edit9.Text+''''
  else
   StringGrid1.Cells[2,sgrid_row]:=' and  data0015.ABBR_NAME LIKE ''%'+edit9.Text+'%''';
 end;
end;

procedure TForm_sel.BitBtn7Click(Sender: TObject);
 var
  InputVar: PDlgInput ;
 begin

  if ListBox1.ItemIndex=0 then
  begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try

    InputVar.Fields := 'spNumber/索赔编号/150,ABBR_NAME/客户简称/150,USER_FULL_NAME/创建人员/150,gc/工厂/150';
    InputVar.Sqlstr := 'SELECT dbo.data0597.spNumber, dbo.data0597.rkey, dbo.data0597.rkey10, dbo.data0597.rkey73,'+
                       'dbo.data0597.rkey15, dbo.Data0010.ABBR_NAME,dbo.Data0073.USER_LOGIN_NAME, dbo.Data0073.USER_FULL_NAME,'+
                       'dbo.Data0015.ABBR_NAME AS gc FROM dbo.data0597  INNER JOIN '+
                       'dbo.Data0015 ON dbo.data0597.rkey15 = dbo.Data0015.RKEY  INNER JOIN '+
                       'dbo.Data0073 ON dbo.data0597.rkey73 = dbo.Data0073.RKEY  INNER JOIN '+
                       'dbo.Data0010 ON dbo.data0597.rkey10 = dbo.Data0010.RKEY ' ;
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit9.Text:=frmPick_Item_Single.adsPick.FieldValues['spNumber'];
      Edit9.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
  if ListBox1.ItemIndex=1 then
  begin
       frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'CUST_CODE/客户代码/200,ABBR_NAME/客户简称/200';
    InputVar.Sqlstr := 'SELECT     RKEY, CUST_CODE, ABBR_NAME FROM    dbo.Data0010';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit9.Tag := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      edit9.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
  if ListBox1.ItemIndex=2 then
  begin
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'USER_LOGIN_NAME/员工工号/200,USER_FULL_NAME/员工姓名/200';
    InputVar.Sqlstr := 'SELECT     USER_FULL_NAME, USER_LOGIN_NAME, RKEY FROM   dbo.Data0073';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit9.Tag := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      edit9.Text := frmPick_Item_Single.adsPick.FieldValues['USER_FULL_NAME'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;
  if ListBox1.ItemIndex=3 then
  begin
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'ABBR_NAME/工厂简称/400';
    InputVar.Sqlstr := 'SELECT     ABBR_NAME, RKEY FROM        dbo.Data0015';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit9.Tag := frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      edit9.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
  end;

 end;

procedure TForm_sel.ListBox1Click(Sender: TObject);
begin
 edit9.text:='';
 Label9.Caption := listbox1.Items[listbox1.ItemIndex];
end;

procedure TForm_sel.Button3Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to StringGrid1.RowCount-2 do
 if StringGrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex]  then
 begin
  self.update_sgrid(i);
  exit;
 end;
 self.update_sgrid(StringGrid1.RowCount-1);
 StringGrid1.RowCount:=StringGrid1.RowCount+1;
end;

procedure TForm_sel.Button4Click(Sender: TObject);
var i:byte;  //重置
begin
 for i:=1 to stringgrid1.RowCount-2 do
 stringgrid1.Rows[i].Clear;
 stringgrid1.RowCount:=2;
end;

procedure TForm_sel.FormCreate(Sender: TObject);
var i :Integer;
begin
 sSql:=DM.ADO597.CommandText ;
 StringGrid1.Cells[0,0]:='条件名';
 StringGrid1.Cells[1,0]:='条件值';
 ListBox1.ItemIndex:=0;
 RadioGroup2.ItemIndex:=1;
 DateTimePicker1.Date:=date;
 DateTimePicker2.Date:=date+1;
end;

procedure TForm_sel.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm_sel.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=StringGrid1.Row to StringGrid1.RowCount-2 do
 StringGrid1.Rows[i].Text:=StringGrid1.Rows[i+1].Text;
 StringGrid1.RowCount:=StringGrid1.RowCount-1;
end;

procedure TForm_sel.PopupMenu1Popup(Sender: TObject);
begin
 if StringGrid1.row=StringGrid1.RowCount-1 then N1.Enabled:=False else N1.Enabled:=True;
end;

end.
