unit mul_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  TForm_mulreport = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    StG1: TStringGrid;
    StG2: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_mulreport: TForm_mulreport;

implementation

uses  damo;

{$R *.dfm}

procedure TForm_mulreport.Button5Click(Sender: TObject);
begin
if stg2.RowCount>=3 then
 ModalResult:=mrok
else
 showmessage('请选择将要打印的入库单!');
end;

procedure TForm_mulreport.FormActivate(Sender: TObject);
var
 i,rkey209:integer;
begin
stg1.Cells[0,0]:='物品名称';
stg1.Cells[1,0]:='供应商';
stg2.Cells[0,0]:='物品名称';
stg2.Cells[1,0]:='供应商';

rkey209:=dm.ADS209Rkey.Value;

//stg1.RowCount:=dm.aqwz456.RecordCount+2;
stg1.RowCount:=2;
dm.ADS209.DisableControls;
dm.ADS209.First;

for i:=1 to dm.ADS209.RecordCount do
 begin
//  if dm.Aqwz456PRINTED.Value='N' then
//  begin
   stg1.RowCount:=stg1.RowCount+1;
   stg1.Cells[0,stg1.RowCount-2]:=dm.ADS209goods_name.Value;
   stg1.Cells[1,stg1.RowCount-2]:=dm.ADS209ABBR_NAME.Value;
   stg1.Cells[2,stg1.RowCount-2]:=dm.ADS209Rkey.AsString;
   stg1.Cells[3,stg1.RowCount-2]:=inttostr(stg1.RowCount-2);
//  end;
  dm.ADS209.Next;
 end;
dm.ADS209.Locate('rkey',rkey209,[]);
dm.ADS209.EnableControls;
if stg1.RowCount<=18 then stg1.ColWidths[1]:=88;

end;

procedure TForm_mulreport.Button1Click(Sender: TObject);
var
 i,j,ii,jj:integer;
begin                             //第一步实现stg2的插入
for i:=stg1.Selection.Top to stg1.Selection.Bottom do
 if i<>stg1.RowCount-1 then       //如果当前行不是最后一行
  begin
   if stg2.RowCount=2 then        //如果STG2当前是空行
    stg2.Rows[1].Text := stg1.Rows[i].Text
   else
    for ii:=1 to stg2.RowCount-2 do  //排序寻找插入的位置 大于当前行
     if strtoint(stg2.Cells[3,ii])>strtoint(stg1.Cells[3,i]) then
      begin
       for jj:=stg2.RowCount-1 downto ii do
        if jj<>ii then
         stg2.Rows[jj].Text := stg2.Rows[jj-1].Text
        else
         stg2.Rows[jj].Text := stg1.Rows[i].Text;
       break;   //插入后跳出内循环
      end
     else
      if ii=stg2.RowCount-2 then                //小于当前行并且是最后一行
       stg2.Rows[ii+1].Text := stg1.Rows[i].Text;
   stg2.RowCount := stg2.RowCount+1;
  end;
                                  //第二步实现stg1的删除
 for i:=stg1.Selection.Top to stg1.Selection.Bottom do
  begin
   for j:=stg1.Selection.Top to stg1.RowCount-2 do
    stg1.Rows[j].Text:=stg1.Rows[j+1].Text;
   if stg1.Selection.Top<=stg1.RowCount-2 then
    stg1.RowCount:=stg1.RowCount-1;
  end;

if stg2.RowCount>=19 then stg2.ColWidths[1]:=75;
if stg1.RowCount<=18 then stg1.ColWidths[1]:=88;
end;

procedure TForm_mulreport.Button3Click(Sender: TObject);
var
 i,ii,j,jj:integer;
begin                               //第一步实现stg1的插入
for i:=stg2.Selection.Top to stg2.Selection.Bottom do
 if i<>stg2.RowCount-1 then //如果当前行不是最后一行
  begin
   if stg1.RowCount=2 then  //如果STG1当前是空行
    stg1.Rows[1].Text := stg2.Rows[i].Text
   else
    for ii:=1 to stg1.RowCount-2 do //排序寻找插入的位置
     if strtoint(stg1.Cells[3,ii])>strtoint(stg2.Cells[3,i]) then
      begin
       for jj:=stg1.RowCount-1 downto ii do
        if jj<>ii then
         stg1.Rows[jj].Text := stg1.Rows[jj-1].Text
        else
         stg1.Rows[jj].Text := stg2.Rows[i].Text;
       break;   //插入后跳出内循环
      end
     else                                                         //增加
      if ii=stg1.RowCount-2 then//小于当前行并且是最后一行
       stg1.Rows[ii+1].Text := stg2.Rows[i].Text;
   stg1.RowCount := stg1.RowCount+1;
  end;
//******************************************************************************
for i:=stg2.Selection.Top to stg2.Selection.Bottom do//第二步实现stringgrid2的删除
 begin
  for j:=stg2.Selection.Top to stg2.RowCount-2 do stg2.Rows[j].Text:=stg2.Rows[j+1].Text;
  if stg2.Selection.Top<=stg2.RowCount-2 then stg2.RowCount:=stg2.RowCount-1;
 end;
if stg2.RowCount<19 then stg2.ColWidths[1]:=92;
if stg1.RowCount>=19 then stg1.ColWidths[1]:=74;
end;

procedure TForm_mulreport.Button2Click(Sender: TObject);
var
 i,rkey209:integer;
begin
if stg1.RowCount>2 then
begin
rkey209:=dm.ADS209Rkey.Value;
stg2.RowCount:=2;

dm.ADS209.DisableControls;
dm.ADS209.First;
for i:=1 to dm.ADS209.RecordCount do
 begin
//  if dm.Aqwz456PRINTED.Value='N' then
//  begin
   stg2.RowCount:=stg2.RowCount+1;
   stg2.Cells[0,stg2.RowCount-2]:=dm.ADS209goods_name.Value;
   stg2.Cells[1,stg2.RowCount-2]:=dm.ADS209ABBR_NAME.Value;
   stg2.Cells[2,stg2.RowCount-2]:=dm.ADS209Rkey.AsString;
   stg2.Cells[3,stg2.RowCount-2]:=inttostr(stg2.RowCount-2);
//  end;
  dm.ADS209.Next;
 end;
dm.ADS209.Locate('rkey',rkey209,[]);
dm.ADS209.EnableControls;

 for i:=1 to stg1.RowCount-2 do stg1.Rows[i].Clear;
 stg1.RowCount:=2;
 stg1.ColWidths[1]:=88;
if stg2.RowCount>=19 then
 stg2.ColWidths[1]:=75
else
 stg2.ColWidths[1]:=92;

end;
end;

procedure TForm_mulreport.Button4Click(Sender: TObject);
var
 i,rkey209:integer;
begin
if stg2.RowCount>2 then
 begin
  rkey209:=dm.ADS209Rkey.Value;
  stg1.RowCount:=2;

  dm.ADS209.DisableControls;
  dm.ADS209.First;
 for i:=1 to dm.ADS209.RecordCount do
  begin
//   if dm.Aqwz456PRINTED.Value='N' then
//   begin
    stg1.RowCount:=stg1.RowCount+1;
    stg1.Cells[0,stg1.RowCount-2]:=dm.ADS209goods_name.Value;
    stg1.Cells[1,stg1.RowCount-2]:=dm.ADS209ABBR_NAME.Value;
    stg1.Cells[2,stg1.RowCount-2]:=dm.ADS209Rkey.AsString;
    stg1.Cells[3,stg1.RowCount-2]:=inttostr(stg1.RowCount-2);
//   end;
   dm.ADS209.Next;
  end;
 dm.ADS209.Locate('rkey',rkey209,[]);
 dm.ADS209.EnableControls;

 for i:=1 to stg2.RowCount-2 do stg2.Rows[i].Clear;
 stg2.RowCount:=2;
 stg2.ColWidths[1]:=92;

 if stg1.RowCount<=18 then
  stg1.ColWidths[1]:=88
 else
  stg1.ColWidths[1]:=74;

 end;
end;

end.
