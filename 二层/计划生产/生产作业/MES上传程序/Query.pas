unit Query;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, Grids, Menus,strutils;

type
  TFrmQuery = class(TForm)
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    ListBox1: TListBox;
    Label1: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    StringGrid1: TStringGrid;
    StaticText2: TStaticText;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
   v_Field_List_CN,v_Field_List_EN:Variant;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses
  Common,Pick_Item_Single,ConstVar, Dm, Main;
{$R *.dfm}

procedure TFrmQuery.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['生产线名称','CCD编号','生产单','产品编号','日期']);
  v_Field_List_EN := VarArrayOf(['Y1417.FASSET_Name','Y1408.ccd_code','Y1406.WORK_ORDER_NUMBER',
  'Y1408.Panel_id','Y1408.T_Date']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
 Listbox1.Items.Add(v_Field_List_CN[i]);
{ for i:=0 to FrmMain.DBGridEh1.Columns.Count-1 do
  if FrmMain.DBGridEh1.Columns[i].Visible then
  Listbox1.Items.Add(FrmMain.DBGridEh1.Columns[i].title.Caption); }
  StringGrid1.Cells[0,0]:='条件名';
  StringGrid1.Cells[1,0]:='条件值';
  Listbox1.ItemIndex:=0;
end;

procedure TFrmQuery.ListBox1Click(Sender: TObject);
begin
Edit1.Text:='';
case  ListBox1.ItemIndex of
0,1,2:
 begin
   RadioGroup1.Items.Clear;
   RadioGroup1.Items.Add('等于');
   RadioGroup1.Items.Add('模糊');
   RadioGroup1.ItemIndex:=0;
 end;
3:
 begin
   RadioGroup1.Items.Clear;
   RadioGroup1.Items.Add('等于');
   RadioGroup1.ItemIndex:=0;
 end;
      end;
 SpeedButton1.Visible:=(ListBox1.ItemIndex=0) or (ListBox1.ItemIndex=1) or (ListBox1.ItemIndex=2);
 Edit1.Visible:=(ListBox1.ItemIndex=0) or (ListBox1.ItemIndex=1) or (ListBox1.ItemIndex=2) or
               (ListBox1.ItemIndex=3)  ;

 DateTimePicker1.Visible :=(ListBox1.ItemIndex=4);
 RadioGroup1.Visible:=not (ListBox1.ItemIndex=4);
 Label1.Caption:=ListBox1.Items.Strings[ListBox1.ItemIndex];
 DateTimePicker1.Date:=common.getsystem_date(FrmDM.ADOQuery1,1)-30;
 DateTimePicker2.Date:=common.getsystem_date(FrmDM.ADOQuery1,1)
end;

procedure TFrmQuery.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    CASE ListBox1.ItemIndex OF
       0:begin
        InputVar.Fields := 'FASSET_CODE/线别编号/180,FASSET_NAME/线别名称/250';
        InputVar.Sqlstr := 'select rkey,FASSET_CODE,FASSET_NAME from Y1417 ORDER by FASSET_CODE';
        Inputvar.KeyField:='';
        InputVar.AdoConn := Frmdm.ADOConnection2 ;
        frmPick_Item_Single.InitForm_New(InputVar);
       if frmPick_Item_Single.ShowModal=mrok then
        begin
          Edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('FASSET_NAME').AsString;
          Edit1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
        end;
      end;
      1:begin
        InputVar.Fields := 'ccd_code/读码器编号/180,install/安装日期/250';
        InputVar.Sqlstr := 'select rkey,CCD_CODE,install from Y1410 ORDER by CCD_CODE';
        Inputvar.KeyField:='';
        InputVar.AdoConn := Frmdm.ADOConnection2 ;
        frmPick_Item_Single.InitForm_New(InputVar);
       if frmPick_Item_Single.ShowModal=mrok then
        begin
          Edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('CCD_CODE').AsString;
          Edit1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
        end;
      end;
     2:begin
       InputVar.Fields := 'WORK_ORDER_NUMBER/作业单号/180,PANELS/投产PANEL数/250';
       InputVar.Sqlstr := 'select rkey,WORK_ORDER_NUMBER,PANELS from Y1406 ORDER by WORK_ORDER_NUMBER ';
       Inputvar.KeyField:='';
       InputVar.AdoConn := Frmdm.ADOConnection2 ;
       frmPick_Item_Single.InitForm_New(InputVar);
       if frmPick_Item_Single.ShowModal=mrok then
       begin
        Edit1.Text:=frmPick_Item_Single.adsPick.fieldbyname('WORK_ORDER_NUMBER').AsString;
        Edit1.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
       end;
      end;
    end;
  finally
    frmPick_Item_Single.Free;
  end
end;

procedure TFrmQuery.BitBtn2Click(Sender: TObject);
var i:integer;
begin
  for i:=1 to StringGrid1.RowCount-1 do
  StringGrid1.Rows[i].Clear;
  StringGrid1.Row := 1;
  StringGrid1.RowCount:=2;
end;

procedure TFrmQuery.BitBtn1Click(Sender: TObject);
 var i,FindRow:integer;bool:boolean;Str:String;
 begin
  bool:=false;
  FindRow:=StringGrid1.RowCount-1;
  for i:=1 to StringGrid1.RowCount-2 do
  if StringGrid1.Cells[0,i]=Listbox1.Items[Listbox1.itemindex] then
   begin
    FindRow:=i;
    bool:=true;
    Continue;
   end;

   Case  Listbox1.itemindex Of
      0,1,2:
       begin
        if trim(Edit1.Text)='' then exit;
           StringGrid1.Cells[0,FindRow]:=ListBox1.Items.Strings[ListBox1.ItemIndex];
        if RadioGroup1.ItemIndex=0 then
           begin
           StringGrid1.Cells[1,FindRow]:=' = '+QuotedStr(Trim(Edit1.Text));
           StringGrid1.Cells[2,FindRow]:=' and '+ v_Field_List_EN[Listbox1.itemindex]+' = '+QuotedStr(Trim(Edit1.Text));
           end
          else
           begin
           StringGrid1.Cells[1,FindRow]:=' like '+QuotedStr(Trim(Edit1.Text));
           StringGrid1.Cells[2,FindRow]:=' and '+v_Field_List_EN[Listbox1.itemindex]+' like '+'''%'+Trim(Edit1.Text)+'%''';
           end;
        end;
       3:
        begin
         if trim(Edit1.Text)='' then exit;
           StringGrid1.Cells[0,FindRow]:=ListBox1.Items.Strings[ListBox1.ItemIndex];
           StringGrid1.Cells[1,FindRow]:=' = '+QuotedStr(Edit1.Text);
           StringGrid1.Cells[2,FindRow]:=' and '+ v_Field_List_EN[Listbox1.itemindex]+' = '+QuotedStr(Trim(Edit1.Text));
        end;
        4:
        begin
        StringGrid1.Cells[0,FindRow]:=ListBox1.Items.Strings[ListBox1.ItemIndex];
        StringGrid1.Cells[1,FindRow]:='从'+formatdatetime('YYYY-MM-DD',DateTimePicker1.Date)+'到'+formatdatetime('YYYY-MM-DD',DateTimePicker2.Date);
        StringGrid1.Cells[2,FindRow]:=' and '+ v_Field_List_EN[Listbox1.itemindex]+' between '+QuotedStr(formatdatetime('YYYY-MM-DD',DateTimePicker1.Date))+' and '+QuotedStr(formatdatetime('YYYY-MM-DD',DateTimePicker2.Date));
        end;
      end;
      if not bool then
      StringGrid1.RowCount:=StringGrid1.RowCount+1;
   end;

procedure TFrmQuery.N1Click(Sender: TObject);
var
 i_row,j_col:integer;
 begin

  IF StringGrid1.RowCount<2 THEN EXIT;
  if StringGrid1.RowCount=2 then
  begin
   StringGrid1.Rows[StringGrid1.row].Clear;
   exit;
  end;
  StringGrid1.Rows[StringGrid1.row].Clear;
  for j_col:=0 to StringGrid1.colcount do
  for i_row:=StringGrid1.Row to StringGrid1.rowcount-1 do
  StringGrid1.cells[j_col,i_row]:=StringGrid1.cells[j_col,i_row+1];
  StringGrid1.RowCount:=StringGrid1.RowCount-1;
  StringGrid1.Refresh;

end;

procedure TFrmQuery.BitBtn3Click(Sender: TObject);
var StrSql,Str:String;i:integer;
begin
if (Edit1.Visible=true) and (Edit1.Text='') then exit;
if (StringGrid1.RowCount=2) and (StringGrid1.Cells[0,1]='') then
begin
FrmDm.ADOSqlData.Close;
Case Listbox1.ItemIndex of
0:begin
  if  RadioGroup1.ItemIndex=0 then
    begin
      FrmDm.ADOSqlData.Close;
      StrSql:='select * from Y1408 where Y1417_Rkey = (select RKEY from Y1417 where FASSET_NAME='+QuotedStr(Trim(Edit1.Text))+')';
      FrmDm.ADOSqlData.CommandText:=StrSql;
    end
  else
    begin
      FrmDm.ADOSqlData.Close;
      StrSql:='select * from Y1408 where Y1417_Rkey = (select RKEY from Y1417 where FASSET_NAME like'+'''%'+Trim(Edit1.Text)+'%'''+')';
      FrmDm.ADOSqlData.CommandText:=StrSql;
    end;
   end;
1:
  begin
  if  RadioGroup1.ItemIndex=1 then
      FrmDm.ADOSqlData.Filter:='ccd_code='+QuotedStr(Trim(Edit1.Text))
  else
      FrmDm.ADOSqlData.Filter:='ccd_code like ''%'+Trim(Edit1.Text)+'%''';
      FrmDm.ADOSqlData.Filtered:=true;
  end;
2:
  begin
  if  RadioGroup1.ItemIndex=0 then
  begin
      FrmDm.ADOSqlData.Close;
      StrSql:='select * from Y1408 where Y1406_Rkey = (select RKEY from Y1406 where WORK_ORDER_NUMBER='+QuotedStr(Trim(Edit1.Text))+')';
      FrmDm.ADOSqlData.CommandText:=StrSql;
  end
  else
  begin
     FrmDm.ADOSqlData.Close;
     StrSql:='select * from Y1408 where Y1406_Rkey = (select RKEY from Y1406 where WORK_ORDER_NUMBER like'+'''%'+Trim(Edit1.Text)+'%'''+')';
     FrmDm.ADOSqlData.CommandText:=StrSql;
  end;
  end;
3: begin
   FrmDm.ADOSqlData.Filter:='pannel_id='+QuotedStr(Trim(Edit1.Text));
   FrmDm.ADOSqlData.Filtered:=true;
   end;
4:begin
   FrmDm.ADOSqlData.Close;
   StrSql:='select * from Y1408 where T_DATE Between'+QuotedStr(formatdatetime('yyyy-mm-dd hh:mm:ss',DateTimePicker1.date))+' and '+QuotedStr(formatdatetime('yyyy-mm-dd hh:mm:ss',DateTimePicker2.date));
   FrmDm.ADOSqlData.CommandText:=StrSql;
   end;
end;
FrmDm.ADOSqlData.Open;
end
else
begin
 Str:='';
 for i:=1 to StringGrid1.RowCount do
 Str:=Str+StringGrid1.Cells[2,i];
 Str:='Select * from Y1408,Y1417,Y1406 where Y1408.Y1417_Rkey=Y1417.RKEY and Y1408.Y1406_Rkey=Y1406.Rkey '+Str;
 FrmDm.ADOSqlData.Close;
 FrmDm.ADOSqlData.CommandText:=Str;
 FrmDm.ADOSqlData.Open;

end;
end;

end.
