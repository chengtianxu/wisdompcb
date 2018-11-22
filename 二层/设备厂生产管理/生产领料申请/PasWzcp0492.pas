unit PasWzcp0492;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Grids, DBGridEh, DB,
  DBClient, Provider,StrUtils, Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DSP: TDataSetProvider;
    CDS: TClientDataSet;
    DataSource1: TDataSource;
    Edit5: TEdit;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure CDSAfterScroll(DataSet: TDataSet);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure CDSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure CDSBeforeClose(DataSet: TDataSet);
    procedure ComboBox1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
    Fcut_no:string;
    FBOMQty:string;
     sSQLtxt:string;
     iReplace:Integer;//是否使用替代物料
    { Private declarations }
    procedure ClientDataSetSort(CDS: TClientDataSet; IndexFields:string; DescField: string='');
  public
    { Public declarations }
    class function InitEdt(iBom_ptr:integer;Grd:TStringGrid;cut_no:string;BOMQty:string):boolean;
  end;

var
  Form1: TForm1;

implementation
uses DM_u;

{$R *.dfm}
//为CDS排序
procedure TForm1.ClientDataSetSort(CDS: TClientDataSet; IndexFields:string; DescField: string='');
var
  IndexDef: TIndexDef;
begin
  if not CDS.Active then Exit;
  CDS.Indexdefs.Clear;

  IndexDef := CDS.Indexdefs.AddIndexDef;
  IndexDef.Name   := 'IndexName1';
  IndexDef.Fields := IndexFields;
  if DescField <> '' then IndexDef.DescFields := DescField;
  CDS.IndexName := 'IndexName1';
  CDS.Indexdefs.Update;
end;

class function TForm1.InitEdt(iBom_ptr:integer;Grd:TStringGrid;cut_no:string;BOMQty:string): boolean;
var i:integer;
    s,s1:string;
begin

  with TForm1.Create(nil) do
  begin
    field_name := DBGridEh1.Columns[0].FieldName;
    PreColumn := DBGridEh1.Columns[1] ;
    PreColumn.Title.Color := clred ;
    FGrd:=Grd;
    Fcut_no:=cut_no;
    FBOMQty:=BOMQty;

    for i:=1 to FGrd.RowCount-2 do
      s:=s+FGrd.Cells[17,i]+',';
    if s<>'' then
    begin
      s1:=' and (not wzcp0492.D017_ptr in ('+s+'0)) ';
    end;
    DM.AdoWzcp492.Close;
//旧SQL
//    DM.AdoWzcp492.SQL.Text:='SELECT cast(0 as bit) Sel,dbo.wzcp0492.STD_QTY, dbo.wzcp0492.App_QTY, dbo.wzcp0492.Con_QTY, dbo.wzcp0492.QUAN_ASSIGN, dbo.wzcp0492.D492_ptr,dbo.wzcp0492.D148_PTR,'
//                            +'      dbo.wzcp0492.D017_ptr, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.INV_NAME,'
//                            +'      dbo.data0492.CUT_NO, dbo.data0492.SO_NO, dbo.data0492.PLANNED_QTY, dbo.data0492.ISSUED_QTY, dbo.data0492.FG_QTY,'
//                            +'      dbo.data0492.TSTATUS,dbo.data0017.QUAN_ON_HAND,data0002.unit_name,isNull(dbo.wzcp0492.STD_QTY,0)-isnull(dbo.wzcp0492.App_QTY,0) as dQUAN_BOM,'''' as vendor'
//                            +' FROM  dbo.wzcp0492 INNER JOIN'
//                            +'      dbo.Data0017 ON dbo.wzcp0492.D017_ptr = dbo.Data0017.RKEY INNER JOIN'
//                            +'      dbo.data0492 ON dbo.wzcp0492.D492_ptr = dbo.data0492.rkey inner join'
//                            +'      dbo.data0002 on dbo.data0017.STOCK_UNIT_PTR=dbo.data0002.rkey'
//                            +' where dbo.wzcp0492.D492_ptr='+inttostr(iBom_ptr)+s;
    DM.AdoWzcp492.SQL.Text:='SELECT cast(0 as bit) Sel,dbo.wzcp0492.STD_QTY, dbo.wzcp0492.App_QTY, dbo.wzcp0492.Con_QTY, dbo.wzcp0492.QUAN_ASSIGN, dbo.wzcp0492.D492_ptr,dbo.wzcp0492.D148_PTR,'
                            +'      wzcp0492.D017_ptr, d17_0.INV_PART_NUMBER, d17_0.INV_DESCRIPTION, d17_0.INV_NAME,d17_0.Rkey Rkey17_0, dbo.wzcp0494.part_name,wzcp0492.wzcp0495_ptr,'
                            +' d17_1.inv_part_number inv_part_number_r ,d17_1.inv_name inv_name_r,d17_1.INV_DESCRIPTION INV_DESCRIPTION_r,d17_1.QUAN_ON_HAND QUAN_ON_HAND_r,d17_1.Rkey Rkey17_r,'
                            +'      dbo.data0492.CUT_NO, dbo.data0492.SO_NO, dbo.data0492.PLANNED_QTY, dbo.data0492.ISSUED_QTY, dbo.data0492.FG_QTY,wzcp0492.Rkey,'
                            +'      dbo.data0492.TSTATUS,d17_0.QUAN_ON_HAND,data0002.unit_name,isNull(dbo.wzcp0492.STD_QTY,0)-isnull(dbo.wzcp0492.App_QTY,0) as dQUAN_BOM,'''' as vendor,'''' as vendor2'
                            +' FROM  dbo.wzcp0492 INNER JOIN'
                            +'      dbo.data0492 ON dbo.wzcp0492.D492_ptr = dbo.data0492.rkey left join'
                            +'      dbo.wzcp0495 on dbo.wzcp0492.wzcp0495_ptr=dbo.wzcp0495.Rkey left join '
                            +'      dbo.wzcp0494 on dbo.wzcp0495.PARTBOM_PTR=dbo.wzcp0494.Rkey INNER JOIN '
                            +'      dbo.Data0017 d17_0 ON wzcp0492.D017_ptr=d17_0.rkey INNER join'
                            +'      dbo.data0002 on d17_0.STOCK_UNIT_PTR=dbo.data0002.rkey left join '
                            +'      data0017 d17_1 on wzcp0495.repl_invt_ptr=d17_1.rkey'
                            +' where dbo.wzcp0492.D492_ptr='+inttostr(iBom_ptr)+s1;
    DM.AdoWzcp492.Open;
    DM.tmp.Close;
    dm.tmp.SQL.Clear;
    DM.tmp.SQL.Text:='SELECT DISTINCT dbo.wzcp0494.part_name '
                            +' FROM  dbo.wzcp0492 INNER JOIN'
                            +'      dbo.Data0017 ON dbo.wzcp0492.D017_ptr = dbo.Data0017.RKEY INNER JOIN'
                            +'      dbo.data0492 ON dbo.wzcp0492.D492_ptr = dbo.data0492.rkey inner join'
                            +'      dbo.data0002 on dbo.data0017.STOCK_UNIT_PTR=dbo.data0002.rkey left join'
                            +'      dbo.wzcp0495 on wzcp0492.wzcp0495_ptr=dbo.wzcp0495.Rkey left join'
                            +'      dbo.wzcp0494 on dbo.wzcp0495.PARTBOM_PTR=dbo.wzcp0494.Rkey'
                            +' where dbo.wzcp0492.D492_ptr='+inttostr(iBom_ptr)+s1;
    DM.tmp.Open;
    while not DM.tmp.Eof do
    begin
      ComboBox1.Items.Append(DM.tmp.Fields[0].asstring);
      DM.tmp.Next;
    end;
    ComboBox1.Items.Append('全部');
    CDS.Data:=DSP.Data;
    showmodal;
    free;
    DM.AdoWzcp492.Close;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var s:string;
begin
  sSQLtxt:=DM.AdoWzcp492.SQL.Text;
  iReplace:=0;
end;

procedure TForm1.CDSAfterScroll(DataSet: TDataSet);
var dTmp:Double;
    sl:string;
begin
//  Edit2.Text:=CDS.fieldbyname('STD_QTY').AsString;
//  Edit3.Text:=CDS.FieldByName('App_QTY').AsString;
//  sl:=CDS.FieldByName('QUAN_ON_HAND').AsString;
//  if TryStrToFloat(Edit2.Text,dTmp)=False then Edit2.Text:='0';
//  if TryStrToFloat(Edit3.Text,dTmp)=False then Edit3.Text:='0';
//  if TryStrToFloat(sl,dTmp)=False then sl:='0';
//  Edit4.Text:=FloatToStr(StrToFloat(Edit2.Text)-StrToFloat(Edit3.Text));
//  if (StrToFloat(sl)>StrToFloat(Edit2.Text)) then
//  Edit5.Text:=Edit4.Text
//  else
//  Edit5.Text:=sl;
////20160118添加备注=供应商简称+仓库名称+具体位置
//  dm.tmp.Close;
//  dm.tmp.SQL.clear;
//  dm.tmp.sqL.Text:='SELECT dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION, dbo.Data0022.spec_place'
//                  +' FROM dbo.Data0022 INNER JOIN'
//                  +'  dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
//                  +'  dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'
//                  +'  dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
//                  +'  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY'
//                  +'  where INVENTORY_PTR=:Rkey17'
//                  +'  group by dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION, dbo.Data0022.spec_place';
//  dm.tmp.Parameters[0].value:=cds.FieldBYName('D017_ptr').asinteger;
//  dm.tmp.Open;
//  Edit6.Text:=DM.tmp.FieldBYName('ABBR_NAME').asstring+' '+DM.tmp.FieldBYName('LOCATION').asstring+' '+DM.tmp.FieldBYName('spec_place').asstring;
//  if (Trim(Edit6.Text)<>'') then
//  begin
//    CDS.Edit;
//    CDS.FieldByName('vendor').AsString:=Trim(Edit6.Text);
//    CDS.Post;
//  end;
end;

procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not CDS.FieldByName('sel').AsBoolean then
  begin
    showmessage('请先勾选,再输入数量');
    abort;
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  CDS.DisableControls;
  screen.Cursor:=crHourGlass;
  CDS.First;
  if CheckBox1.Checked then
  begin
    while not cds.eof do
    begin
      if (CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value>0) then
      begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=true;
      if (CDS.FieldByName('QUAN_ON_HAND').Value>CDS.fieldbyname('STD_QTY').Value) then
      CDS.FieldByName('dQUAN_BOM').Value:=CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value
      else
      CDS.FieldByName('dQUAN_BOM').Value:=CDS.FieldByName('QUAN_ON_HAND').Value;
      CDS.Post;
      end else
      begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=False;
      CDS.Post;
      end;
      CDS.Next;
    end;
  end else
  begin
    while not CDS.Eof do
    begin
      CDS.Edit;
      CDS.FieldByName('sel').AsBoolean:=false;
      CDS.Post;
      CDS.Next;
    end ;
  end;
  CDS.EnableControls;
  screen.Cursor:=crDefault;

//  CDS.DisableControls;
//  screen.Cursor:=crHourGlass;
//  CDS.First;
//  while not CDS.Eof do
//  begin
//    CDS.Edit;
//    CDS.FieldByName('sel').AsBoolean:=true;
//    CDS.Post;
//    CDS.Next;
//  end;
//  CDS.EnableControls;
//  screen.Cursor:=crDefault;
end;

procedure TForm1.DBGridEh1CellClick(Column: TColumnEh);
var dTmp:Double;
    sl:string;
begin
  if ((CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value<=0) and (Column.FieldName='Sel')) then
  begin
    Edit5.Enabled:=False;
    Edit6.Enabled:=False;
  end else
  begin
    Edit5.Enabled:=True;
    Edit6.Enabled:=True;
    Edit2.Text:=CDS.fieldbyname('STD_QTY').AsString;
    Edit3.Text:=CDS.FieldByName('App_QTY').AsString;
    sl:=CDS.FieldByName('QUAN_ON_HAND').AsString;
    if TryStrToFloat(Edit2.Text,dTmp)=False then Edit2.Text:='0';
    if TryStrToFloat(Edit3.Text,dTmp)=False then Edit3.Text:='0';
    if TryStrToFloat(sl,dTmp)=False then sl:='0';
    Edit4.Text:=FloatToStr(StrToFloat(Edit2.Text)-StrToFloat(Edit3.Text));
    if (StrToFloat(sl)>StrToFloat(Edit2.Text)) then
    Edit5.Text:=Edit4.Text
    else
    Edit5.Text:=sl;
  //20160118添加备注=供应商简称+仓库名称+具体位置
    dm.tmp.Close;
    dm.tmp.SQL.clear;
    dm.tmp.sqL.Text:='SELECT dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION, dbo.Data0022.spec_place'
                    +' FROM dbo.Data0022 INNER JOIN'
                    +'  dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'
                    +'  dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'
                    +'  dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
                    +'  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY'
                    +'  where INVENTORY_PTR=:Rkey17'
                    +'  group by dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION, dbo.Data0022.spec_place';
    dm.tmp.Parameters[0].value:=cds.FieldBYName('Rkey17_0').asinteger;
    dm.tmp.Open;
    Edit6.Text:=DM.tmp.FieldBYName('ABBR_NAME').asstring+' '+DM.tmp.FieldBYName('LOCATION').asstring+' '+DM.tmp.FieldBYName('spec_place').asstring;
    if (Trim(Edit6.Text)<>'') then
    begin
      CDS.Edit;
      CDS.FieldByName('vendor2').AsString:=Trim(Edit6.Text);
      CDS.Post;
    end;
  end;


//  iRecNo:=CDS.RecNo;
//  CDS.DisableControls;
//  screen.Cursor:=crHourGlass;
//  CDS.First;
//  while not CDS.Eof do
//  begin
//    CDS.Edit;
//    CDS.FieldByName('sel').AsBoolean:=false;
//    CDS.Post;
//    CDS.Next;
//  end ;
//  CDS.EnableControls;
//  screen.Cursor:=crDefault;
//  CDS.RecNo:=iRecNo;
//  if (CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value<=0) then
//  begin
//    Edit5.Enabled:=False;
//    Edit6.Enabled:=False;
//  end else
//  begin
//    Edit5.Enabled:=True;
//    Edit6.Enabled:=True;
//  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j,iYN:Integer;
begin
//  if (CheckBox1.Checked=True) then
//  begin
//    if not CDS.FieldByName('sel').AsBoolean then
//    begin
//      showmessage('请先勾选..');
//      abort;
//    end;
  if CDS.State in [dsEdit,dsInsert] then CDS.Post;
  CDS.AfterScroll:=nil;
    cds.DisableControls;
    CDS.Filtered:=false;
    CDS.First;
    i:=FGrd.RowCount-1;
    iYN:=0;
    screen.Cursor:=crHourGlass;
    while not CDS.Eof do
    begin
      if ((CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value>0) and (CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('QUAN_ON_HAND').Value>0)) then
      begin
        iYN:=0;
//判断新增加的材料是否已存在，并提示
        for  j:= 1 to FGrd.RowCount-2 do
        begin
          if (FGrd.Cells[7,j]=CDS.FieldByName('Rkey17_0').AsString) then
          begin
            iYN:=1;
            Break;
          end;
        end;
        if (iYN=0) then
        begin
        FGrd.Cells[0,i]:=CDS.FieldByName('INV_PART_NUMBER').AsString;
        FGrd.Cells[1,i]:=CDS.FieldByName('INV_NAME').AsString;
        FGrd.Cells[2,i]:=CDS.FieldByName('INV_DESCRIPTION').AsString;
//        if (CDS.FieldByName('QUAN_ON_HAND').Value>CDS.fieldbyname('STD_QTY').Value) then
//        FGrd.Cells[3,i]:=FloatToStr(CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value)
//        else
//        FGrd.Cells[3,i]:=FloatToStr(CDS.fieldbyname('QUAN_ON_HAND').Value);
        FGrd.Cells[3,i]:=FloatToStr(CDS.fieldbyname('dQUAN_BOM').Value);
        FGrd.Cells[4,i]:=CDS.FieldBYName('vendor2').AsString; 
//        FGrd.Cells[4,i]:=CDS.FieldByName('ABBR_NAME').AsString+' '+CDS.FieldByName('LOCATION').AsString+' '+CDS.FieldByName('spec_place').AsString;
        FGrd.Cells[5,i]:=CDS.FieldByName('unit_name').AsString;
        FGrd.Cells[6,i]:='材料';
        FGrd.Cells[7,i]:=CDS.FieldByName('Rkey17_0').AsString;
        FGrd.Cells[8,i]:='0';//标准物料
        FGrd.Cells[9,i]:=CDS.FieldByName('D492_ptr').AsString;//data0492.Rkey
        FGrd.Cells[10,i]:=FloatToStr(CDS.fieldbyname('STD_QTY').Value);
        FGrd.Cells[11,i]:=FloatToStr(CDS.fieldbyname('App_QTY').Value);
        FGrd.Cells[12,i]:=FloatToStr(CDS.fieldbyname('dQUAN_BOM').Value);
        FGrd.Cells[13,i]:=FloatToStr(CDS.fieldbyname('Con_QTY').Value);
        FGrd.Cells[14,i]:=CDS.FieldByName('wzcp0495_ptr').AsString;//rkey495
        FGrd.Cells[15,i]:=CDS.FieldByName('part_name').AsString;//494BOM名称
        FGrd.Cells[16,i]:=CDS.FieldBYName('QUAN_ON_HAND').AsString;//当前库存
        FGrd.Cells[17,i]:=CDS.FieldBYName('Rkey17_0').AsString;//主料17.Rkey
        FGrd.Cells[18,i]:=CDS.FieldBYName('D148_PTR').AsString;//data0148.rkey

        DM.ADO468_1.Append;
        DM.ADO468_1.FieldByName('INVENT_PTR').AsInteger:=CDS.FieldByName('Rkey17_0').AsInteger;
        DM.ADO468_1.FieldByName('quan_bom').AsFloat:=CDS.fieldbyname('dQUAN_BOM').AsFloat;
        DM.ADO468_1.FieldByName('VENDOR').AsString:=CDS.FieldBYName('vendor2').AsString;
//        DM.ADO468_1.FieldByName('VENDOR').AsString:=CDS.FieldByName('ABBR_NAME').AsString+' '+CDS.FieldByName('LOCATION').AsString+' '+CDS.FieldByName('spec_place').AsString;
        DM.ADO468_1.FieldByName('CUT_NO').AsString:=CDS.FieldByName('CUT_NO').AsString;
        DM.ADO468_1.FieldByName('SO_NO').AsString:=CDS.FieldByName('SO_NO').AsString;
        DM.ADO468_1.FieldByName('STATUS').AsInteger:=0;
        DM.ADO468_1.FieldByName('invent_or').AsInteger:=0;//标准物料
//        DM.ADO468_1.FieldByName('bom_list_ptr').AsInteger:=CDS.FieldByName('D148_PTR').AsInteger; //data0148.rkey
        DM.ADO468_1.FieldByName('wzcp0492_ptr').AsInteger:=CDS.FieldByName('Rkey').AsInteger; //wzcp0492.rkey
        DM.ADO468_1.Post;
        inc(i);
        FGrd.RowCount:=FGrd.RowCount+1;
        end;
      end;
      CDS.Next;
    end;
    CDS.EnableControls;
    screen.Cursor:=crDefault;
//  end else
//  begin
//    if
//    if ((StrToFloat(Edit5.Text)-strToFloat(Edit2.Text))>0) then
//    begin
//      showmessage('本次申领数量不能超过总需求量！');
//      Edit5.SetFocus;
//      abort;
//    end;
//    i:=FGrd.RowCount-1;
//    FGrd.Cells[0,i]:=CDS.FieldByName('INV_PART_NUMBER').AsString;
//    FGrd.Cells[1,i]:=CDS.FieldByName('INV_NAME').AsString;
//    FGrd.Cells[2,i]:=CDS.FieldByName('INV_DESCRIPTION').AsString;
//    FGrd.Cells[3,i]:=Trim(Edit5.Text);
//    FGrd.Cells[4,i]:=Trim(Edit6.Text);
//    FGrd.Cells[5,i]:=CDS.FieldByName('unit_name').AsString;
//    FGrd.Cells[6,i]:='材料';
//    FGrd.Cells[7,i]:=CDS.FieldByName('D017_ptr').AsString;
//    FGrd.Cells[8,i]:='0';//标准物料
//    FGrd.Cells[9,i]:=CDS.FieldByName('D492_ptr').AsString;//data0492.Rkey
//
//    DM.ADO468_1.Append;
//    DM.ADO468_1.FieldByName('INVENT_PTR').AsInteger:=CDS.FieldByName('D017_ptr').AsInteger;
//    DM.ADO468_1.FieldByName('quan_bom').AsFloat:=StrToFloat(Trim(Edit5.Text));
//    DM.ADO468_1.FieldByName('VENDOR').AsString:=Trim(Edit6.Text);
//    DM.ADO468_1.FieldByName('CUT_NO').AsString:=CDS.FieldByName('CUT_NO').AsString;
//    DM.ADO468_1.FieldByName('SO_NO').AsString:=CDS.FieldByName('SO_NO').AsString;
//    DM.ADO468_1.FieldByName('STATUS').AsInteger:=0;
//    DM.ADO468_1.FieldByName('invent_or').AsInteger:=0;//标准物料
////    DM.ADO468_1.FieldByName('bom_list_ptr').AsInteger:=CDS.FieldByName('D492_ptr').AsInteger; //data0492.rkey
//    DM.ADO468_1.Post;
//    inc(i);
//    FGrd.RowCount:=FGrd.RowCount+1;
//  end;
  modalresult:=mrok;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
//    if trim(Edit1.text) <> '' then
//    begin
//        CDS.Filter:=' (' + preColumn.FieldName +' like ''%'+ Trim(Edit1.Text)+'%'')';
//    end else
//        CDS.Filter:='';
   with CDS do
    if trim(Edit1.Text) <> '' then
    begin
      Filtered := False;
     // Filter   := 'Filter_FieldName = %'+trim(Filter_edit.Text)+'%';
      Filtered := true;
    end
    else
      Filtered := False;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
var
  OldIndex: string;
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if  Column.Grid.DataSource.DataSet.Active then
  if  Column.Field<>nil then
  begin
    if ( Column.Field.DataType <> ftBlob)and(Column.Field.FieldKind=fkData) then
    with (Column.Grid.DataSource.DataSet as TClientDataSet) do
    begin
      OldIndex:= IndexName;
      if OldIndex <> '' then
      begin
        IndexName:= '';
        DeleteIndex(OldIndex);
      end;
      case Column.Title.SortMarker of
        smNoneEh,smUpEh  :
        begin
          AddIndex(column.Field.FieldName, Column.Field.FieldName, [ixDescending]);
          Column.Title.SortMarker:= smDownEh;
        end;
        smDownEh:
        begin
          AddIndex(column.Field.FieldName, Column.Field.FieldName, [ixPrimary]);
          Column.Title.SortMarker:= smUpEh;
        end;
      end;
      IndexName:= column.Field.FieldName;
    end;
  end;
//单个一次性排序
//  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
//  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
//  begin
//    column.Title.SortMarker:=smUpEh;
//  end
//  else
//  begin
//    column.Title.SortMarker:=smDownEh;
//    CDS.IndexFieldNames:=Column.FieldName;
//  end;

  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm1.CDSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  if Assigned(Edit1) then
  if Trim(Edit1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(preColumn.FieldName).AsString),UpperCase(Edit1.Text) ) ;
  if (Trim(ComboBox1.text)='全部') then
  begin
  if Assigned(ComboBox1) then
  if Trim(ComboBox1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase('*'),UpperCase('*') ) ;
  end else
  if Assigned(ComboBox1) then
  if Trim(ComboBox1.Text) <>'' then
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName('part_name').AsString),UpperCase(ComboBox1.Text) ) ;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (CDS.RecNo=CDS.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.AdoWzcp492.SQL.Text);
end;

procedure TForm1.Edit5Exit(Sender: TObject);
begin
  if (Trim(Edit5.Text)='') then Edit5.Text:='0';
  if (Trim(Edit4.Text)='') then Edit4.Text:='0';
  if StrToFloat(Trim(Edit5.Text))<strTofloat(Trim(edit4.Text)) then
  begin
    CDS.Edit;
    CDS.FieldByName('dQUAN_BOM').AsFloat:=StrToFloat(Trim(Edit5.Text));
    CDS.Post;
  end;
end;

procedure TForm1.Edit6Exit(Sender: TObject);
begin
  if (Trim(Edit6.Text)<>'') then
  begin
    CDS.Edit;
    CDS.FieldByName('vendor').AsString:=Trim(Edit6.Text);
    CDS.Post;
  end;
end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if (CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value<=0) then
     DBGridEh1.Canvas.Font.Color := clBlue;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.CDSBeforeClose(DataSet: TDataSet);
var i:Integer;
begin
  with (DataSet as TClientDataSet) do
  if  IndexName<>'' then
  DeleteIndex(IndexName) ;               //清除已存在的索引

  with   DBGridEh1    do
  for i:=0 to Columns.Count-1  do      //清除表格中的排序状态
  begin
    if  Columns[i].Title.SortMarker<> smNoneEh   then
    Columns[i].Title.SortMarker:= smNoneEh;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
   with CDS do
    if trim(ComboBox1.Text) <> '' then
    begin
      Filtered := False;
      Filtered := true;
    end
    else
      Filtered := False;
end;

procedure TForm1.N1Click(Sender: TObject);
var i,j,iYN:Integer;
begin
  iReplace:=1;
  if CDS.State in [dsEdit,dsInsert] then CDS.Post;
  CDS.AfterScroll:=nil;
    cds.DisableControls;
    CDS.Filtered:=false;
    CDS.First;
    i:=FGrd.RowCount-1;
    iYN:=0;
    screen.Cursor:=crHourGlass;
    while not CDS.Eof do
    begin
      if (CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value>0) and (CDS.FieldByName('sel').AsBoolean=True) then
      begin
        CDS.Edit;
        if (CDS.FieldByName('QUAN_ON_HAND_r').Value>CDS.fieldbyname('STD_QTY').Value) then
          CDS.FieldByName('dQUAN_BOM').Value:=CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value
        else
          CDS.FieldByName('dQUAN_BOM').Value:=CDS.FieldByName('QUAN_ON_HAND_r').Value;
        CDS.Post;
      end;

      if ((CDS.fieldbyname('STD_QTY').Value-CDS.FieldByName('App_QTY').Value>0) and (CDS.FieldByName('sel').AsBoolean=True) and (CDS.FieldByName('QUAN_ON_HAND_r').Value>0)) then
      begin
        iYN:=0;
//判断新增加的材料是否已存在，并提示
        for  j:= 1 to FGrd.RowCount-2 do
        begin
          if (FGrd.Cells[7,j]=CDS.FieldByName('Rkey17_r').AsString) then
          begin
            iYN:=1;
            Break;
          end;
        end;
        if (iYN=0) then
        begin
        FGrd.Cells[0,i]:=CDS.FieldByName('inv_part_number_r').AsString;
        FGrd.Cells[1,i]:=CDS.FieldByName('inv_name_r').AsString;
        FGrd.Cells[2,i]:=CDS.FieldByName('INV_DESCRIPTION_r').AsString;
        FGrd.Cells[3,i]:=FloatToStr(CDS.fieldbyname('dQUAN_BOM').Value);
        FGrd.Cells[4,i]:=CDS.FieldBYName('vendor').AsString;
        FGrd.Cells[5,i]:=CDS.FieldByName('unit_name').AsString;
        FGrd.Cells[6,i]:='材料';
        FGrd.Cells[7,i]:=CDS.FieldByName('Rkey17_r').AsString;
        FGrd.Cells[8,i]:='0';//标准物料
        FGrd.Cells[9,i]:=CDS.FieldByName('D492_ptr').AsString;//data0492.Rkey
        FGrd.Cells[10,i]:=FloatToStr(CDS.fieldbyname('STD_QTY').Value);
        FGrd.Cells[11,i]:=FloatToStr(CDS.fieldbyname('App_QTY').Value); //已申领数量
        FGrd.Cells[12,i]:=FloatToStr(CDS.fieldbyname('dQUAN_BOM').Value);//申领数量2
        FGrd.Cells[13,i]:=FloatToStr(CDS.fieldbyname('Con_QTY').Value);//已发放数
        FGrd.Cells[14,i]:=CDS.FieldByName('D148_PTR').AsString;//rkey148
        FGrd.Cells[15,i]:=CDS.FieldByName('part_name').AsString;//140BOM名称
        FGrd.Cells[16,i]:=CDS.FieldBYName('QUAN_ON_HAND_r').AsString;//当前库存
        FGrd.Cells[17,i]:=CDS.FieldBYName('Rkey17_0').AsString;//主料17.Rkey

        DM.ADO468_1.Append;
        DM.ADO468_1.FieldByName('INVENT_PTR').AsInteger:=CDS.FieldByName('Rkey17_r').AsInteger;
        DM.ADO468_1.FieldByName('quan_bom').AsFloat:=CDS.fieldbyname('QUAN_ON_HAND_r').AsFloat;//
        DM.ADO468_1.FieldByName('VENDOR').AsString:=CDS.FieldBYName('vendor').AsString;
        DM.ADO468_1.FieldByName('CUT_NO').AsString:=CDS.FieldByName('CUT_NO').AsString;
        DM.ADO468_1.FieldByName('SO_NO').AsString:=CDS.FieldByName('SO_NO').AsString;
        DM.ADO468_1.FieldByName('STATUS').AsInteger:=0;
        DM.ADO468_1.FieldByName('invent_or').AsInteger:=0;//标准物料
        DM.ADO468_1.FieldByName('bom_list_ptr').AsInteger:=CDS.FieldByName('D148_PTR').AsInteger; //data0148.rkey
        DM.ADO468_1.Post;
        inc(i);
        FGrd.RowCount:=FGrd.RowCount+1;
        end;
      end;
      CDS.Next;
    end;
    CDS.EnableControls;
    screen.Cursor:=crDefault;
  modalresult:=mrok;
end;

end.
