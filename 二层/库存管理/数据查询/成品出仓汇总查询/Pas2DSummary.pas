unit Pas2DSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGridEh, DB,
  ADODB;

type
  Tfrm2DSummary = class(TForm)
    pnl2: TPanel;
    btn1: TSpeedButton;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    Ado64: TADOQuery;
    ComboBox2: TComboBox;
    Eh1: TDBGridEh;
    SG: TStringGrid;
    AdoCol_cb2: TADOQuery;
    AdoRow_cb3: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure showSG;
    function return_col(AField, AValue: Variant): integer;
    function return_row(AField, AValue: Variant): integer;
  public
    ttype,ttype2:byte;         //分类索引
    ttype_name:string;  //分类名称
    { Public declarations }
  end;

var
  frm2DSummary: Tfrm2DSummary;

implementation

uses common,Frm_main_u;

{$R *.dfm}

procedure Tfrm2DSummary.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm2DSummary.FormShow(Sender: TObject);
var i:integer;
begin
  PageControl1.ActivePage:=TabSheet1;
   for i:=0 to 5 do
   begin
     eh1.Columns[i].Field:=Ado64.Fields[i];
//     if i=2 then TFloatField(Ado64.Fields[i]).DisplayFormat:='#,###';
     if i>1 then
     begin
       TFloatField(Ado64.Fields[i]).DisplayFormat:='#,##0.00';
       eh1.Columns[i].Footer.FieldName:=Ado64.Fields[i].FieldName;
     end;
   end;
   eh1.Columns[0].Width:=150;
   eh1.Columns[1].Width:=150;
   eh1.Columns[2].Width:=120;
   eh1.Columns[3].Width:=120;
   eh1.Columns[4].Width:=120;
   eh1.Columns[5].Width:=120;

   eh1.Columns[2].Title.caption:= '数量';
   eh1.Columns[3].Title.caption:= '面积';
   eh1.Columns[4].Title.caption:= '金额(不含税本币)';
   eh1.Columns[5].Title.caption:= '金额(含税本币)';

  case ttype of
   0:eh1.Columns[0].Title.caption:='日期';
   1:eh1.Columns[0].Title.caption:='月份';
   2:eh1.Columns[0].Title.caption:='产品组别';
   3:eh1.Columns[0].Title.caption:='类型代码';
   4:eh1.Columns[0].Title.caption:='客户代码';
   5:eh1.Columns[0].Title.caption:='本厂编号';
  end;
  case ttype2 of
   0:eh1.Columns[1].Title.caption:='日期';
   1:eh1.Columns[1].Title.caption:='月份';
   2:eh1.Columns[1].Title.caption:='产品组别';
   3:eh1.Columns[1].Title.caption:='类型代码';
   4:eh1.Columns[1].Title.caption:='客户代码';
   5:eh1.Columns[1].Title.caption:='本厂编号';
  end;
  showSG;
end;

procedure Tfrm2DSummary.PageControl1Change(Sender: TObject);
begin
  if pagecontrol1.ActivePageIndex=1 then
  begin
    combobox2.Enabled:=true;
    if (ComboBox2.ItemIndex=-1) then ComboBox2.ItemIndex:=0;
  end else begin
    combobox2.Enabled:=false;
  end;
end;

procedure Tfrm2DSummary.showSG;
var i,iRow:Integer;
begin
  if not Ado64.IsEmpty then
  begin
    SG.Cells[0,0]:=eh1.Columns[0].Title.caption+'/'+eh1.Columns[1].Title.caption;
    iRow:=1;
    SG.RowCount:=AdoCol_cb2.RecordCount+2;
    SG.ColCount:=AdoRow_cb3.RecordCount+2;
    AdoCol_cb2.First;
    while not AdoCol_cb2.Eof do
    begin
      SG.Cells[0,iRow]:=AdoCol_cb2.fieldBYName('name').AsString;

      if (ComboBox2.ItemIndex=0) or (ComboBox2.ItemIndex=-1) then   //  数量
       SG.Cells[SG.ColCount-1,iRow]:=AdoCol_cb2.fieldbyname('Qty').AsString
      else if ComboBox2.ItemIndex=1 then   //  面积
       SG.Cells[SG.ColCount-1,iRow]:=AdoCol_cb2.fieldbyname('Area').AsString
      else if ComboBox2.ItemIndex=2 then   //  不含税金额
       SG.Cells[SG.ColCount-1,iRow]:=AdoCol_cb2.fieldbyname('NotaxMount').AsString
      else if ComboBox2.ItemIndex=3 then   //  含税金额
       SG.Cells[SG.ColCount-1,iRow]:=AdoCol_cb2.fieldbyname('taxMount').AsString;

      AdoCol_cb2.Next;
      iRow:=iRow+1;
    end;
    i:=0;
    AdoRow_cb3.First;
    while not AdoRow_cb3.Eof do
    begin
      SG.ColWidths[i]:=100;
      SG.Cells[i+1,0]:=AdoRow_cb3.Fields[0].asstring;

      if (ComboBox2.ItemIndex=0) or (ComboBox2.ItemIndex=-1) then   //  数量
       SG.Cells[i+1,SG.RowCount-1]:=AdoRow_cb3.fieldbyname('Qty').AsString
      else if ComboBox2.ItemIndex=1 then   //  面积
       SG.Cells[i+1,SG.RowCount-1]:=AdoRow_cb3.fieldbyname('Area').AsString
      else if ComboBox2.ItemIndex=2 then   //  不含税金额
       SG.Cells[i+1,SG.RowCount-1]:=AdoRow_cb3.fieldbyname('NotaxMount').AsString
      else if ComboBox2.ItemIndex=3 then   //  含税金额
       SG.Cells[i+1,SG.RowCount-1]:=AdoRow_cb3.fieldbyname('taxMount').AsString;

      AdoRow_cb3.Next;
      i:=i+1;
    end;
    SG.ColWidths[sg.ColCount-2]:=100;
    SG.ColWidths[sg.ColCount-1]:=120;

//填充中间值--默认数量
    Ado64.DisableControls;
    Ado64.First;
    while not Ado64.Eof do
    begin
      if (ComboBox2.ItemIndex=0) or (ComboBox2.ItemIndex=-1) then
      begin
        SG.Cells[return_col(ado64.fields[1].FieldName,Ado64.fields[1].value),
                  return_row(ado64.fields[0].FieldName,ado64.fields[0].value)]:=
                  ado64.fieldbyname('Qty').asstring;
      end else if ComboBox2.ItemIndex=1 then
      begin
        SG.Cells[return_col(ado64.fields[1].FieldName,Ado64.fields[1].value),
                  return_row(ado64.fields[0].FieldName,ado64.fields[0].value)]:=
                  ado64.fieldbyname('Area').asstring;
      end else if ComboBox2.ItemIndex=2 then
      begin
        SG.Cells[return_col(ado64.fields[1].FieldName,Ado64.fields[1].value),
                  return_row(ado64.fields[0].FieldName,ado64.fields[0].value)]:=
                  ado64.fieldbyname('NotaxMount').asstring;
      end else if ComboBox2.ItemIndex=3 then
      begin
        SG.Cells[return_col(ado64.fields[1].FieldName,Ado64.fields[1].value),
                  return_row(ado64.fields[0].FieldName,ado64.fields[0].value)]:=
                  ado64.fieldbyname('taxMount').asstring;
      end;
      Ado64.Next;
    end;
    Ado64.First;
    Ado64.EnableControls;
    //汇总字样：
    SG.Cells[SG.ColCount-1,0]:='汇总';
    SG.Cells[0,SG.RowCount-1]:='汇总';

  end;
end;

function Tfrm2DSummary.return_col(AField, AValue: Variant): integer;
begin
 if AdoRow_cb3.Locate(afield,AValue,[]) then
   result:=AdoRow_cb3.RecNo
 else
   result:=0;
end;

function Tfrm2DSummary.return_row(AField, AValue: Variant): integer;
begin
  if AdoCol_cb2.Locate(afield,AValue,[]) then
    result:=AdoCol_cb2.RecNo
  else
    result:=0;
end;

procedure Tfrm2DSummary.ComboBox2Change(Sender: TObject);
begin
  showSG;
end;

procedure Tfrm2DSummary.Eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then showmessage(Ado64.SQL.Text);
end;

procedure Tfrm2DSummary.btn1Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(Eh1,self.Caption) ;
end;

end.
