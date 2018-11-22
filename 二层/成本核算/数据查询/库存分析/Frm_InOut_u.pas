unit Frm_InOut_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ImgList, ExtCtrls, DBGridEh, Grids, DB,math,
  DBClient, ComCtrls,ADODB;

type
  TFrm_InOut = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PnlMat: TPanel;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    ImOut: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    EdtType: TEdit;
    SpeedButton1: TSpeedButton;
    ImIn: TImage;
    DS: TDataSource;
    DS517: TDataSource;
    Label4: TLabel;
    Edit1: TEdit;
    CDS: TClientDataSet;
    Sgrid: TStringGrid;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ImInClick(Sender: TObject);
    procedure ImOutClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtTypeExit(Sender: TObject);
    procedure EdtTypeEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure Read(tmp:TADOQuery);
    procedure FormShow(Sender: TObject);
  private
    FRkeyMattype:integer;
    FcutDate,Fcuttime:string;
    FrkeyCut:string;
    FsMattypeName:string;
    iRow:Integer;
    D:string;
    fStock,fTotalIn,fTotalOut:real;
  public

    procedure init(scutDate,scuttime,srkeyCut:string);
    { Public declarations }
  end;

var
  Frm_InOut: TFrm_InOut;

implementation
 uses damo,common,invtype_search;
{$R *.dfm}

procedure TFrm_InOut.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_InOut.SpeedButton1Click(Sender: TObject);
begin
  with TForm_invtype.Create(nil) do
  try
    if (showmodal=mrok) and not ADOQuery1.IsEmpty and (FRkeyMattype<>ADOQuery1.Fields[0].AsInteger) then
    begin
      FRkeyMattype:=ADOQuery1.Fields[0].AsInteger;
      EdtType.Text:=ADOQuery1.Fields[1].AsString;
      Label3.Caption:=ADOQuery1.Fields[2].AsString;

      DM.ado17.Close;
      DM.ado17.Parameters[0].Value:=FRkeyMattype;
      DM.ado17.open;
      CDS.Data:=DM.dsp517.data;
      PnlMat.Visible:=true;
      ImIn.Visible:=true;
    end;
  finally
    free;
  end;
end;

procedure TFrm_InOut.Edit1Change(Sender: TObject);
begin
  if edit1.Text<>'' then
    CDS.Filter:='inv_part_number like ''%' +edit1.Text+'%'''
  else
    CDS.Filter:='';
 CDS.Filtered:=true;
end;

procedure TFrm_InOut.ImInClick(Sender: TObject);
begin
  ImIn.Visible:=false;
  PnlMat.Visible:=false;
  ImOut.Visible:=true;
end;

procedure TFrm_InOut.ImOutClick(Sender: TObject);
begin
  ImIn.Visible:=true;
  PnlMat.Visible:=true;
  ImOut.Visible:=false;
end;

procedure TFrm_InOut.BitBtn2Click(Sender: TObject);
var
  i:integer;
begin
  if DateTimePicker1.Date<strtodate(FcutDate) then
  begin
    showmessage('截止日期不能小于开始日期...');
    exit;
  end;
  if not cds.Active then exit;
  CDS.DisableControls;
  CDS.Filter:='';
  CDS.First;

  i:=0;
  iRow:=1;
  Sgrid.RowCount:=2;
  Sgrid.Cells[0,iRow]:='' ;
  Sgrid.Cells[1,iRow]:='' ;
  Sgrid.Cells[2,iRow]:='' ;
  Sgrid.Cells[3,iRow]:='' ;
  Sgrid.Cells[4,iRow]:='' ;
  Sgrid.Cells[5,iRow]:='' ;

  while not CDS.Eof do
  begin
    if cds.FieldByName('sel').AsBoolean then
    begin
      DM.tmp.Close;
      DM.tmp.SQL.Text:='select sum(quantity) from data0445 where d0444_ptr='+FrkeyCut+' and invent_ptr='+cds.FieldByName('rkey').AsString;
      DM.tmp.Open;
      fStock:=DM.tmp.Fields[0].AsFloat;

      Sgrid.Cells[0,iRow]:=cds.FieldByName('inv_part_number').AsString ;
      Sgrid.Cells[1,iRow]:=Fcuttime ;
      Sgrid.Cells[2,iRow]:='期初结存' ;
      Sgrid.Cells[3,iRow]:='' ;
      Sgrid.Cells[4,iRow]:='' ;
      Sgrid.Cells[5,iRow]:=floattostr(fStock);
      inc(iRow);
      Sgrid.RowCount:=Sgrid.RowCount+1;

      //入库
      DM.tmp.Close;
      dm.tmp.SQL.Text:='select cast(cast(d456.create_date as varchar(10)) as datetime) d,d456.grn_number rem, d22.quantity,1 tp from data0022 d22'+
                       ' inner join data0456 d456 on d22.grn_ptr=d456.rkey where d456.create_date>:Fcuttime and d456.create_date<=:dtpk1 and d22.inventory_ptr=:rkey17';
//      DM.tmp.SQL.Text:='exec Mat_InOutDetail '+cds.FieldByName('rkey').AsString+','''+Fcuttime+''','''+datetimetostr(DateTimePicker1.Date+frac(DateTimePicker2.time))+'''';
      dm.tmp.Parameters[0].Value:=Fcuttime;
      dm.tmp.Parameters[1].Value:= datetimetostr(DateTimePicker1.Date+frac(DateTimePicker2.time));
      dm.tmp.Parameters[2].Value:= cds.FieldByName('rkey').AsString;
      DM.tmp.Open;
      Read(dm.tmp);

      //盘点
      DM.tmp.Close;
      dm.tmp.SQL.Text:='select cast(cast(Tran_date as varchar(10)) as datetime) d,reference_number rem, quantity,2 tp from data0095 where'+
                       ' Tran_date>:Fcuttime and Tran_date<=:dtpk1 and invt_ptr=:rkey17 and tran_tp=23 ';
      dm.tmp.Parameters[0].Value:=Fcuttime;
      dm.tmp.Parameters[1].Value:= datetimetostr(DateTimePicker1.Date+frac(DateTimePicker2.time));
      dm.tmp.Parameters[2].Value:= cds.FieldByName('rkey').AsString;
      DM.tmp.Open;
      Read(dm.tmp);

      //发料
      DM.tmp.Close;
      dm.tmp.SQL.Text:='select cast(cast(d457.create_date as varchar(10)) as datetime) d,d457.gon_number rem, d207.quantity,3 tp from data0207 d207'+
                       ' inner join data0457 d457 on d207.gon_ptr=d457.rkey'+
                       ' where d457.create_date>:Fcuttime and d457.create_date<=:dtpk1 and d207.inventory_ptr=:rkey17';
      dm.tmp.Parameters[0].Value:=Fcuttime;
      dm.tmp.Parameters[1].Value:= datetimetostr(DateTimePicker1.Date+frac(DateTimePicker2.time));
      dm.tmp.Parameters[2].Value:= cds.FieldByName('rkey').AsString;
      DM.tmp.Open;
      Read(dm.tmp);

      //退货
      DM.tmp.Close;
      dm.tmp.SQL.Text:='select cast(cast(Tdate as varchar(10)) as datetime) d,reference_number rem, Quan_rejd quantity,4 tp from data0096 where'+
                       ' Tdate>:Fcuttime and Tdate<=:dtpk1 and invt_ptr=:rkey17 and flag=''2''';
      dm.tmp.Parameters[0].Value:=Fcuttime;
      dm.tmp.Parameters[1].Value:= datetimetostr(DateTimePicker1.Date+frac(DateTimePicker2.time));
      dm.tmp.Parameters[2].Value:= cds.FieldByName('rkey').AsString;
      DM.tmp.Open;
      Read(dm.tmp);

      //报废
      DM.tmp.Close;
      dm.tmp.SQL.Text:='select cast(cast(Tdate as varchar(10)) as datetime) d,reference_number rem, Quan_rejd quantity,5 tp from data0096 where'+
                       ' Tdate>:Fcuttime and Tdate<=:dtpk1 and invt_ptr=:rkey17 and flag=''1''';
      dm.tmp.Parameters[0].Value:=Fcuttime;
      dm.tmp.Parameters[1].Value:= datetimetostr(DateTimePicker1.Date+frac(DateTimePicker2.time));
      dm.tmp.Parameters[2].Value:= cds.FieldByName('rkey').AsString;
      DM.tmp.Open;
      Read(dm.tmp);

      Sgrid.Cells[0,iRow]:='' ;
      Sgrid.Cells[1,iRow]:='' ;
      Sgrid.Cells[2,iRow]:='合计' ;
      Sgrid.Cells[3,iRow]:=floattostr(fTotalIn) ;
      Sgrid.Cells[4,iRow]:=floattostr(fTotalOut) ;
      Sgrid.Cells[5,iRow]:='';
      fTotalIn:=0;
      fTotalOut:=0;
      inc(iRow);
      Sgrid.RowCount:=Sgrid.RowCount+1;
      inc(i);
      if i=5 then break;
    end;
    cds.Next;
  end;

  PnlMat.Visible:=false;
  CDS.EnableControls;
  ImIn.Visible:=false;
  ImOut.Visible:=true;
  if i=0 then showmessage('请选择材料编码后再查询...');
end;

procedure TFrm_InOut.Read(tmp:TADOQuery);
var
  sRem:string;
begin
  while not tmp.Eof do
  begin
    Sgrid.Cells[0,iRow]:='' ;
    if D<>tmp.Fields[0].AsString then
      Sgrid.Cells[1,iRow]:=tmp.Fields[0].AsString  //日期
    else
      Sgrid.Cells[1,iRow]:='';

    sRem:='' ;
    if tmp.Fields[3].AsInteger=1 then
      sRem:='入库:'+tmp.Fields[1].AsString
    else
      if DM.tmp.Fields[3].AsInteger=2 then
        sRem:='盘点:'+tmp.Fields[1].AsString
      else
        if DM.tmp.Fields[3].AsInteger=3 then
          sRem:='发料:'+tmp.Fields[1].AsString
        else
          if DM.tmp.Fields[3].AsInteger=4 then
            sRem:='退货:'+tmp.Fields[1].AsString
          else
            if DM.tmp.Fields[3].AsInteger=5 then
              sRem:='报废:'+tmp.Fields[1].AsString;

    Sgrid.Cells[2,iRow]:=sRem ; //说明
    if (tmp.Fields[3].AsInteger=1) or (tmp.Fields[3].AsInteger=2) then
    begin
      Sgrid.Cells[3,iRow]:=tmp.Fields[2].AsString ; //入库
      Sgrid.Cells[4,iRow]:='' ; //出库
      fStock:=fStock+tmp.Fields[2].asfloat;
      fTotalIn:=fTotalIn+tmp.Fields[2].AsFloat;
    end
    else
    begin
      Sgrid.Cells[3,iRow]:=''; //入库
      Sgrid.Cells[4,iRow]:=tmp.Fields[2].AsString ; //出库
      fStock:=fStock-tmp.Fields[2].asfloat;
      fTotalOut:=fTotalOut+tmp.Fields[2].ASFloat;
    end;
    Sgrid.Cells[5,iRow]:=floattostr(fStock) ;     //库存
    D:=tmp.Fields[0].AsString;
    tmp.Next;
    inc(iRow);
    Sgrid.RowCount:=Sgrid.RowCount+1;
  end;
end;

procedure TFrm_InOut.init(scutDate,scuttime,srkeyCut:string);
begin
  FcutDate:=scutDate;
  Fcuttime:=scuttime;
  FrkeyCut:=srkeyCut;
  DateTimePicker1.Date:=strtodate(scutDate)+31;
  DateTimePicker2.Time:=now;
  Sgrid.Cells[0,0]:='材料编码';
  Sgrid.Cells[1,0]:='日期';
  Sgrid.Cells[2,0]:='说明';
  Sgrid.Cells[3,0]:='入库';
  Sgrid.Cells[4,0]:='出库';
  Sgrid.Cells[5,0]:='库存';
end;

procedure TFrm_InOut.EdtTypeExit(Sender: TObject);
begin
  if FsMattypeName<>EdtType.Text then
  begin
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select rkey,group_name,group_desc from data0496 where group_name='''+EdtType.Text+'''';
    DM.tmp.Open;
    if DM.tmp.IsEmpty then
      SpeedButton1Click(nil)
    else begin
      FRkeyMattype:=DM.tmp.Fields[0].AsInteger;
      EdtType.Text:=DM.tmp.Fields[1].AsString;
      Label3.Caption:=DM.tmp.Fields[2].AsString;

      DM.ado17.Close;
      DM.ado17.Parameters[0].Value:=FRkeyMattype;
      DM.ado17.open;
      CDS.Data:=DM.dsp517.data;
      PnlMat.Visible:=true;
      ImIn.Visible:=true;
    end;
  end;
end;

procedure TFrm_InOut.EdtTypeEnter(Sender: TObject);
begin
  FsMattypeName:=EdtType.Text;
end;

procedure TFrm_InOut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    SelectNext(ActiveControl,true,true);
end;

procedure TFrm_InOut.BitBtn3Click(Sender: TObject);
begin
  Export_Grid_to_Excel(Sgrid,'材料进出存明细');
end;

procedure TFrm_InOut.FormShow(Sender: TObject);
begin
  iRow:=1;
  D:='';
  fTotalIn:=0;
  fTotalOut:=0;
end;

end.
