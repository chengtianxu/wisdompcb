unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, MXGRID, ExtCtrls, MXPIVSRC, MXDB, DB, DBTables, MXTABLES,
  Mxstore, Menus, StdCtrls, Buttons, ADODB, DBGrids, ComCtrls, Excel2000,
  OleServer,mxcommon, DBGridEh, DBClient, Provider;

type
  TFrmMain = class(TForm)
    ADOConnection1: TADOConnection;
    ADO009: TADOStoredProc;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1rep_code: TStringField;
    ADOQuery1sales_rep_name: TStringField;
    adoords: TADOStoredProc;
    ADOQuery1: TADOStoredProc;
    ADOQuery3: TADOStoredProc;
    DS: TDataSource;
    CDS: TClientDataSet;
    DSP10: TDataSetProvider;
    ADO10: TADOQuery;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    RadioGroup4: TRadioGroup;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    RadioGroup3: TRadioGroup;
    RadioGroup1: TRadioGroup;
    BitBtn5: TBitBtn;
    Edit5: TEdit;
    StaticText1: TStaticText;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses Details,  Totals, rep_search,common;

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(ADOConnection1 ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;


 // user_ptr:='4';
 // vprev:='4';
  //ADOConnection1.Open;
end;


procedure TFrmMain.FormShow(Sender: TObject);
begin
  datetimepicker1.Date :=now-30;
  datetimepicker2.Date :=now;
  ADO10.Open;
  ADO10.FieldByName('sel').ReadOnly:=false;
  cds.Data:=DSP10.Data;

  Adoquery3.Open ;

  With ADOQuery1 do
  begin
    Close;
    parameters.ParamByName('@user_ptr').Value :=strtoint(user_ptr);
    open;
  end;
  if (ADOQuery1.IsEmpty) or (Adoquery3.FieldByName('SALESANALYSIS').AsInteger=0) then
  begin
    Edit5.Enabled :=false;
    Radiogroup4.Enabled :=false;
    Radiogroup4.ItemIndex :=0;
    bitbtn5.Enabled :=false;
  end else
  if ADOQuery1.FieldByName('class').AsInteger=0 then
  begin
    Edit5.Visible :=true;
    bitbtn5.Visible :=true;
    Edit5.Text :=ADOQuery1.fieldbyname('rep_code').AsString;
    StaticText1.Caption :=ADOQuery1.FieldValues['sales_rep_name'];
    Edit5.Enabled :=false;
    Radiogroup4.Enabled :=false;
    Radiogroup4.ItemIndex :=1;
    bitbtn5.Enabled :=false;
    if ADOQuery1.IsEmpty then
      bitbtn1.Enabled :=false;
  end else
  if ADOQuery1.FieldByName('class').AsInteger=1 then
  with Ado009 do
  begin
    close;
    parameters.ParamByName('@vptr').Value :=0;
    parameters.ParamByName('@vptr2').Value :=ADOQuery1.fieldbyname('rkey').AsInteger;
    open;
  end else
  if ADOQuery1.FieldByName('class').AsInteger=2 then
  with Ado009 do
  begin
    close;
    parameters.ParamByName('@vptr').Value :=1;
    parameters.ParamByName('@vptr2').Value :=strtoint(user_ptr);
    open;
  end;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
var i:integer;
    vamt,vamt1,vamt2:real;
    vnum1,vnum2:integer;
    sCust:string;
begin
  vamt1:=0;
  vamt2:=0;
  vnum1:=0;
  vnum2:=0;
  vamt:=0;
  sCust:='';
  cds.DisableControls;
  cds.Filter:='sel=1';
  cds.First;
  while not cds.Eof do
  begin
    sCust:=sCust+cds.fieldbyname('rkey').AsString+',';
    cds.Next;
  end;
  cds.Filter:='';
  cds.EnableControls;
  if sCust='' then
  begin
    showmessage('请选择客户...');
    exit;
  end;
  sCust:=sCust+'0';
  adoords.Close;
  adoords.Parameters.ParamByName('@tot').Value :=Radiogroup1.ItemIndex;
  adoords.Parameters.ParamByName('@data1').Value :=datetostr( DateTimePicker1.Date );
  adoords.Parameters.ParamByName('@data2').Value :=datetostr( DateTimePicker2.Date );
  adoords.Parameters.ParamByName('@cust1').Value :=sCust;
  adoords.Parameters.ParamByName('@ody').Value := inttostr(RadioGroup3.ItemIndex );
  if (ADOQuery1.IsEmpty) or (Adoquery3.FieldByName('SALESANALYSIS').AsInteger=0) then
  begin
    adoords.Parameters.ParamByName('@salesby').Value :='0';
    adoords.Parameters.ParamByName('@salestyp').Value :=0;
  end
  else
  begin
    if Radiogroup4.ItemIndex=0 then
    begin
      adoords.Parameters.ParamByName('@salesby').Value :=adoquery1.fieldbyname('rkey').AsString  ;
      if ADOQuery1.FieldByName('class').AsInteger=1  then
        adoords.Parameters.ParamByName('@salestyp').Value := 1
      else
        adoords.Parameters.ParamByName('@salestyp').Value := 0;
    end
    else
    begin
      adoords.Parameters.ParamByName('@salesby').Value :=ado009.fieldbyname('rkey').AsString  ;
      adoords.Parameters.ParamByName('@salestyp').Value := 0;
    end;
  end;

  adoords.Open;
  if adoords.IsEmpty then
  begin
    showmessage('没有数据');
    exit;
  end;

  if Radiogroup1.ItemIndex=1 then
  begin
    FrmDetails:=TFrmDetails.Create(nil);
    i:=1;
    with ADOOrds do
    while not eof do
    begin
      FrmDetails.stringgrid1.RowCount :=i+1;
      FrmDetails.stringgrid1.Cells[0,i]:=Fieldbyname('cust_code').asstring;
      FrmDetails.stringgrid1.Cells[1,i]:=Fieldbyname('customer_Part_number').asstring;
      //FrmDetails.stringgrid1.Cells[2,i]:=Fieldbyname('cp_rev').asstring;
      FrmDetails.stringgrid1.Cells[3,i]:=Fieldbyname('sales_order').asstring;
      FrmDetails.stringgrid1.Cells[4,i]:=Fieldbyname('parts_ordered').asstring;
      FrmDetails.stringgrid1.Cells[5,i]:=Fieldbyname('orig_sched_ship_date').asstring;
//      if .AsCurrency+1>=Fieldbyname('ordered_amt').AsCurrency then
        FrmDetails.stringgrid1.Cells[7,i]:=format('%.0f',[Fieldbyname('cnt_1').asfloat]) ;
        vnum2:=vnum2+Fieldbyname('cnt_1').AsInteger;
        //准期
        FrmDetails.stringgrid1.Cells[6,i]:=format('%.0f',[Fieldbyname('cnt_2').asfloat]);
        vnum1:=vnum1+Fieldbyname('cnt_2').AsInteger;

      FrmDetails.stringgrid1.Cells[8,i]:=format('%.2f',[Fieldbyname('amt_2').asfloat]);
      FrmDetails.stringgrid1.Cells[9,i]:=format('%.2f',[(Fieldbyname('amt').asfloat-Fieldbyname('amt_2').asfloat)]);
      vamt1:=vamt1+Fieldbyname('amt_2').AsCurrency;
      vamt2:=vamt2+Fieldbyname('amt').AsCurrency-Fieldbyname('amt_2').AsCurrency;
      vamt:=vamt+ Fieldbyname('amt').AsCurrency;
      next;
      i:=i+1;
    end;
    FrmDetails.stringgrid1.RowCount :=FrmDetails.stringgrid1.RowCount+1;
    FrmDetails.stringgrid1.Cells[1,FrmDetails.stringgrid1.RowCount-1]:='金额合计';
    FrmDetails.stringgrid1.Cells[4,i]:=format('%.2f',[vamt]);
    FrmDetails.stringgrid1.Cells[6,i]:=inttostr(vnum1);
    FrmDetails.stringgrid1.Cells[7,i]:=inttostr(vnum2);
    FrmDetails.stringgrid1.Cells[8,i]:=format('%.2f',[vamt1]);
    FrmDetails.stringgrid1.Cells[9,i]:=format('%.2f',[vamt2]);
    FrmDetails.Series1.Clear ;
    FrmDetails.Series1.Add(vamt2,'延期交货金额',clRed);
    FrmDetails.Series1.Add(vamt1,'准期交货金额',clYellow);
    FrmDetails.ShowModal;
    FrmDetails.Free;
  end else begin
    Frmtotals:=TFrmtotals.Create(nil);
    vamt:=0;
    i:=1;
    Frmtotals.Series1.Clear ;
    Frmtotals.Series2.Clear ;
    with ADOOrds do
    while not eof do
    begin
      if Fieldbyname('amt_all').AsString <> ''  then
      begin
        Frmtotals.stringgrid1.RowCount :=i+1;
        Frmtotals.stringgrid1.Cells[0,i]:=Fieldbyname('cust_code').asstring;
        Frmtotals.stringgrid1.Cells[1,i]:=Fieldbyname('customer_name').asstring;
        Frmtotals.stringgrid1.Cells[2,i]:=format('%.2f',[Fieldbyname('amt_all').asfloat]);
        Frmtotals.stringgrid1.Cells[3,i]:=format('%.2f',[Fieldbyname('amt').asfloat]);
        Frmtotals.stringgrid1.Cells[4,i]:=format('%.2f',[Fieldbyname('amt_1').asfloat]);
        Frmtotals.stringgrid1.Cells[5,i]:=format('%.2f',[Fieldbyname('amt_all').asfloat-Fieldbyname('amt_1').asfloat]);
        if Fieldbyname('amt_1').asfloat = 0 then
        begin
          Frmtotals.stringgrid1.Cells[6,i]:='0%';
          Frmtotals.Series1.Add(0,Fieldbyname('cust_code').asstring,0);
          Frmtotals.Series2.Add(100,Fieldbyname('cust_code').asstring,0);
        end
        else
        begin
          Frmtotals.stringgrid1.Cells[6,i]:=format('%.2f',[100*Fieldbyname('amt_1').asfloat/Fieldbyname('amt_all').asfloat])+'%';
          Frmtotals.Series1.Add(100*Fieldbyname('amt_1').asfloat/(Fieldbyname('amt_all').asfloat),Fieldbyname('cust_code').asstring,0);
          Frmtotals.Series2.Add(100*(Fieldbyname('amt_all').asfloat-Fieldbyname('amt_1').asfloat)/(Fieldbyname('amt_all').asfloat),Fieldbyname('cust_code').asstring,0);
        end;
        vamt1:=vamt1+Fieldbyname('amt_1').asfloat;
        vamt2:=vamt2+Fieldbyname('amt_all').asfloat-Fieldbyname('amt_1').asfloat;
        vamt:=vamt+ Fieldbyname('amt_all').asfloat;
        i:=i+1;
      end;
      next;
    end;
    Frmtotals.stringgrid1.RowCount :=Frmtotals.stringgrid1.RowCount+1;
    Frmtotals.stringgrid1.Cells[1,Frmtotals.stringgrid1.RowCount-1]:='合计';
    Frmtotals.stringgrid1.Cells[2,i]:=format('%.2f',[vamt]);
//    Frmtotals.stringgrid1.Cells[3,i]:=format('%.2f',[vamt1+vamt2]);
    Frmtotals.stringgrid1.Cells[4,i]:=format('%.2f',[vamt1]);
    Frmtotals.stringgrid1.Cells[5,i]:=format('%.2f',[vamt2]);
    if vamt1+vamt2>0 then
      Frmtotals.stringgrid1.Cells[6,i]:=format('%.2f',[100*vamt1/(vamt)])+'%';
    Frmtotals.showmodal;
    Frmtotals.free;
  end;

end;

procedure TFrmMain.RadioGroup1Click(Sender: TObject);
begin
  RadioGroup3.Enabled:=Radiogroup1.ItemIndex=1;
end;

procedure TFrmMain.RadioGroup4Click(Sender: TObject);
begin
  if Radiogroup4.Enabled then
  if Radiogroup4.ItemIndex =0 then
  begin
    Edit5.Visible :=false;
    bitbtn5.Visible :=false;
    StaticText1.Visible :=false;
  end else
  begin
    Edit5.Visible :=true;
    bitbtn5.Visible :=true;
    StaticText1.Visible :=true;
    Edit5.SetFocus;
  end;
end;

procedure TFrmMain.Edit5Exit(Sender: TObject);
begin
  if (activecontrol<>bitbtn5) and (activecontrol<>Bitbtn2) and (trim(edit5.Text)<>'') then
  try
    rep_form := Trep_form.Create(Application);
    rep_form.Edit1.Text:=trim(edit5.Text);
    if Ado009.IsEmpty then
    begin
      messagedlg('对不起,没有找到符合条件的记录!',mtinformation,[mbok],0);
      edit5.SetFocus;
    end
    else
    if comparetext(trim(edit5.text),trim(Ado009.Fieldbyname('rep_code').AsString))=0 then
    begin
      edit5.Font.Color:=clwindowtext;
    end
    else
    begin
      messagedlg('代表代码不正确,请重新输入或选择',mtinformation,[mbok],0);
      edit5.SetFocus;
    end;
  finally
    rep_form.free;
  end;
end;

procedure TFrmMain.Edit5Click(Sender: TObject);
begin
  if edit5.Font.Color=clwindowtext then
  begin
    edit5.SelectAll;
    edit5.Font.Color:=clblue;
  end;
end;

procedure TFrmMain.BitBtn5Click(Sender: TObject);
begin
  try
    rep_form := Trep_form.Create(Application);
    rep_form.Edit1.Text:=edit5.Text;
    if ADO009.IsEmpty then
    begin
      messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
      edit5.SetFocus;
    end
    else
    if rep_form.showmodal=mrok then
    begin
      edit5.Text:=Ado009.FieldValues['rep_code'];
      StaticText1.Caption :=Ado009.FieldValues['sales_rep_name'];
      edit5.Font.Color:=clwindowtext;
      BitBtn5.SetFocus;
    end
    else
     edit5.SetFocus;
 finally
   rep_form.free;
 end;
end;

procedure TFrmMain.Edit1Change(Sender: TObject);
begin
  if edit1.Text<>'' then
    CDS.Filter:='cust_code like ''%' +edit1.Text+'%'''
  else
    CDS.Filter:='';
end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.CheckBox1Click(Sender: TObject);
begin
  CDS.DisableControls;
  CDS.First;
  while not CDS.Eof do
  begin
    CDS.Edit;
    CDS.FieldByName('sel').AsBoolean:=CheckBox1.Checked;
    CDS.Next;
  end;
  CDS.First;
  CDS.EnableControls;
end;

end.
