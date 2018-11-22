unit uRpCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  Tmul_Rp = class(TForm)
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
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure setCol1With();//设置列宽
    procedure setCol2With();
  public
    { Public declarations }
  end;

var
  mul_Rp: Tmul_Rp;

implementation

uses uDM;

{$R *.dfm}
//
procedure Tmul_Rp.setCol1With();
begin
if stg1.RowCount>18 then
 begin
  stg1.ColWidths[0]:=round(stg1.Width/5)*2;
  stg1.ColWidths[1]:=round(stg1.Width/5)*3-23;
 end
 else
  begin
   stg1.ColWidths[0]:=round(stg1.Width/5)*2;
   stg1.ColWidths[1]:=stg1.Width-round(stg1.Width/5)*2-7;
 end
end;


procedure Tmul_Rp.setCol2With();
begin
if stg2.RowCount>18 then
 begin
  stg2.ColWidths[0]:=round(stg2.Width/5)*2;
  stg2.ColWidths[1]:=round(stg2.Width/5)*3-23;
 end
else
 begin
  stg2.ColWidths[0]:=round(stg2.Width/5)*2;

  stg2.ColWidths[1]:=stg2.Width-round(stg2.Width/5)*2-7;
 end;

end;
procedure Tmul_Rp.FormActivate(Sender: TObject);
var
 i,rkey:integer;
begin
stg1.Cells[0,0]:='凭证编号';
stg1.Cells[1,0]:='业务类型';
stg2.Cells[0,0]:='凭证编号';
stg2.Cells[1,0]:='业务类型';
rkey:=dm.ADOQ105rkey.Value;
stg1.RowCount:=dm.ADOQ105.RecordCount+2;

if stg1.RowCount>18 then
 begin
  stg1.ColWidths[0]:=round(stg1.Width/5)*2;
  stg1.ColWidths[1]:=round(stg1.Width/5)*3-23;
 end;

dm.ADOQ105.DisableControls;
dm.ADOQ105.First;
for i:=1 to dm.ADOQ105.RecordCount do
 begin
  stg1.Cells[0,i]:=dm.ADOQ105voucher.Value;
  stg1.Cells[1,i]:=dm.ADOQ105ctype.Value;
  stg1.Cells[2,i]:=dm.ADOQ105rkey.AsString;
  stg1.Cells[3,i]:=inttostr(i);
  dm.ADOQ105.Next;
 end;
dm.ADOQ105.Locate('rkey',rkey,[]);
dm.ADOQ105.EnableControls;

end;

procedure Tmul_Rp.Button1Click(Sender: TObject);
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
 setCol2With //设置列宽
end;
//全部过到右边
procedure Tmul_Rp.Button2Click(Sender: TObject);
var
 i,rkey:integer;
begin
if stg1.RowCount>2 then
begin
rkey:=dm.ADOQ105rkey.Value;
stg2.RowCount:=dm.ADOQ105.RecordCount+2;

setCol2With; //设置列宽

dm.ADOQ105.DisableControls;
dm.ADOQ105.First;


for i:=1 to dm.ADOQ105.RecordCount do
 begin
  stg2.Cells[0,i]:=dm.ADOQ105voucher.Value;
  stg2.Cells[1,i]:=dm.ADOQ105ctype.Value;
  stg2.Cells[2,i]:=dm.ADOQ105rkey.AsString;
  stg2.Cells[3,i]:=inttostr(i);
  dm.ADOQ105.Next;
 end;
dm.ADOQ105.Locate('rkey',rkey,[]);
dm.ADOQ105.EnableControls;

 for i:=1 to stg1.RowCount-2 do stg1.Rows[i].Clear;
 stg1.RowCount:=2;
 stg1.ColWidths[1]:=88;
end;
end;
//一个到左边
procedure Tmul_Rp.Button3Click(Sender: TObject);
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
setCol2With();
setCol1With();
end;
//全部过到左边
procedure Tmul_Rp.Button4Click(Sender: TObject);
var
 i,rkey:integer;
begin
if stg2.RowCount>2 then
begin
 rkey:=dm.ADOQ105rkey.Value;
 stg1.RowCount:=dm.ADOQ105.RecordCount+2;
 
 self.setCol1With;   
 dm.ADOQ105.DisableControls;
 dm.ADOQ105.First;
 for i:=1 to dm.ADOQ105.RecordCount do
  begin
   stg1.Cells[0,i]:=dm.ADOQ105voucher.Value;
   stg1.Cells[1,i]:=dm.ADOQ105ctype.Value;
   stg1.Cells[2,i]:=dm.ADOQ105rkey.AsString;
   stg1.Cells[3,i]:=inttostr(i);

   dm.ADOQ105.Next;
  end;
 dm.ADOQ105.Locate('rkey',rkey,[]);
 dm.ADOQ105.EnableControls;

 for i:=1 to stg2.RowCount-2 do stg2.Rows[i].Clear;
 
 stg2.RowCount:=2;
 stg2.ColWidths[1]:=92;
end;

end;

procedure Tmul_Rp.Button5Click(Sender: TObject);
begin
 if stg2.RowCount>=3 then
  ModalResult:=mrok
 else
  showmessage('请选择将要打印的单据!');
end;

end.
