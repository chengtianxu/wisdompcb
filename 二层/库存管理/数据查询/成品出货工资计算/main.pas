unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,Excel2000,ClipBrd,ComObj;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

   procedure CopysgridToExcel(sg: TStringGrid;title_caption:string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, defin_wage, sql_condition,common;

{$R *.dfm}

procedure TForm1.CopysgridToExcel(sg: TStringGrid;title_caption:string);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
  begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
  end;
  try
   XLApp := CreateOleObject('Excel.Application');
  except
   Screen.Cursor := crDefault;
   Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  for iCount := 0 to sg.ColCount - 1 do
   Sheet.Cells[1, iCount + 1 ] := sg.Cells[icount,0];

  for jcount :=1 to sg.RowCount-1 do
   for iCount := 0 to sg.ColCount - 1 do
    Sheet.Cells[jCount + 1, iCount + 1] := sg.Cells[iCount,jcount];

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
form2:=tform2.Create(application);
form2.ShowModal;
form2.Free;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:integer;
 total_qty,total_sqft,total_sosqft:double;
begin
form3:=tform3.Create(application);
if form3.ShowModal=mrok then
 begin
  if stringgrid1.RowCount>2 then
  for i:=1 to stringgrid1.RowCount-1 do
   stringgrid1.Rows[i].Clear;
  dm.AQ34.Close;
  dm.AQ34.Open;
  stringgrid1.ColCount:=8+dm.AQ34.RecordCount;
  for i:=1 to dm.AQ34.RecordCount do
   begin
    stringgrid1.Cells[i+7,0]:=dm.AQ34DEPT_NAME.Value;
    dm.AQ34.Next;
   end;
   
  total_qty:=0;
  total_sqft:=0;
  total_sosqft:=0;
  stringgrid1.RowCount:=form3.AQ52.RecordCount+2;
  with form3.AQ52 do
  for i:=1 to RecordCount do
   begin
    stringgrid1.Cells[0,i]:= form3.AQ52MANU_PART_NUMBER.Value; //'本厂编号';
    stringgrid1.Cells[1,i]:= form3.AQ52MANU_PART_DESC.Value;   //'客户型号';
//    stringgrid1.Cells[2,i]:= form3.AQ52CP_REV.Value;               //'版本';
    stringgrid1.Cells[3,i]:= form3.AQ52ABBR_NAME.Value;            //'客户简称';
    stringgrid1.Cells[4,i]:= form3.AQ52PRODUCT_NAME.Value;        //'产品类型';
    stringgrid1.Cells[5,i]:= form3.AQ52putout_total.AsString;      //'出仓数量';
    stringgrid1.Cells[6,i]:= form3.AQ52mianqi.AsString;            //'出仓面积';
    stringgrid1.Cells[7,i]:= form3.AQ52amount.AsString;         //'出仓金额';
    dm.ADS38.Close;
    dm.ADS38.Parameters[0].Value:=form3.AQ52rkey.Value;
    dm.ADS38.Open;
    while not dm.ADS38.Eof do
     begin
      dm.AQ34.First;
      if dm.AQ34.Locate('rkey',dm.ADS38dept_ptr.Value,[]) then
       if stringgrid1.Cells[7+dm.AQ34.RecNo,i]='' then
        stringgrid1.Cells[7+dm.AQ34.RecNo,i]:='1'
       else
        stringgrid1.Cells[7+dm.AQ34.RecNo,i]:=
          inttostr(strtoint(stringgrid1.Cells[7+dm.AQ34.RecNo,i])+1);
      dm.ADS38.Next;
     end;
    dm.ADS494.Close;
    dm.ADS494.Parameters[0].Value:=form3.AQ52RKEY.Value;
    dm.ADS494.Open;
    while not dm.ADS494.Eof do
     begin
       dm.AQ34.First;
       if dm.AQ34.Locate('rkey',dm.ADS494rkey34.Value,[]) then
         stringgrid1.Cells[7+dm.AQ34.RecNo,i]:=stringgrid1.Cells[7+dm.AQ34.RecNo,i]+'(面数:'+trim(dm.ADS494PARAMETER_VALUE.Value)+')';
       dm.ADS494.Next;
     end;
    total_qty:=total_qty+form3.AQ52putout_total.Value;
    total_sqft:=total_sqft+form3.AQ52mianqi.Value;
    total_sosqft:=total_sosqft+form3.AQ52amount.Value;
    Next;
   end;

  stringgrid1.Cells[0,stringgrid1.RowCount-1]:='  合计:';
  stringgrid1.Cells[5,stringgrid1.RowCount-1]:= floattostr(total_qty);
  stringgrid1.Cells[6,stringgrid1.RowCount-1]:= floattostr(total_sqft);
  stringgrid1.Cells[7,stringgrid1.RowCount-1]:= floattostr(total_sosqft);
 end;
form3.Free;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='本厂编号';
 stringgrid1.Cells[1,0]:='客户型号';
// stringgrid1.Cells[2,0]:='版本';
 stringgrid1.ColWidths[2]:=0;
 stringgrid1.Cells[3,0]:='客户简称';
 stringgrid1.Cells[4,0]:='产品类型';
 stringgrid1.Cells[5,0]:='出仓数量';
 stringgrid1.Cells[6,0]:='出仓面积';
 stringgrid1.Cells[7,0]:='金额';


end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
self.CopysgridToExcel(stringgrid1,Caption);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  if not App_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

end.
