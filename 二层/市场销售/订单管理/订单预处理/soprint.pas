unit soprint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppCtrls, ppBands, ppStrtch, ppMemo, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe,
  Grids, DBGrids, ComCtrls, StdCtrls, ExtCtrls, myChkBox, ppModule,
  raCodMod, Buttons, ppVar;

type
  TForm_SoPrint = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    Button1: TButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    ppDBPipeline2ppField1: TppField;
    ppDBPipeline2ppField2: TppField;
    ppDBPipeline2ppField3: TppField;
    ppDBPipeline2ppField4: TppField;
    ppDBPipeline2ppField5: TppField;
    ppDBPipeline2ppField6: TppField;
    ppDBPipeline2ppField7: TppField;
    ppDBPipeline2ppField8: TppField;
    ppDBPipeline2ppField9: TppField;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADOQuery1ORIG_REQUEST_DATE: TDateTimeField;
    ADOQuery1PARTS_ORDERED: TIntegerField;
    ADOQuery1PART_PRICE: TFloatField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1PO_DATE: TDateTimeField;
    ADOQuery1status: TWordField;
    ADOQuery1user_ptr: TIntegerField;
    ADOQuery1submit_date: TDateTimeField;
    ADOQuery1total_case: TFloatField;
    ADOQuery1audit_ptr: TIntegerField;
    ADOQuery1audit_date: TDateTimeField;
    ADOQuery1so_oldnew: TStringField;
    ADOQuery1is_alter: TWordField;
    ADOQuery1lis_num: TStringField;
    ADOQuery1sstatus: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1CUSTOMER_NAME: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1isNew: TBooleanField;
    ADOQuery1isOld: TBooleanField;
    ADOQuery1noalter: TBooleanField;
    ADOQuery1isalter: TBooleanField;
    ppDB213: TppDBPipeline;
    ADOQuery1sales_rep_name: TStringField;
    ADOQuery1employee_name: TStringField;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    ppTitleBand1: TppTitleBand;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText7: TppDBText;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLine5: TppLine;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine40: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine17: TppLine;
    ppDBText13: TppDBText;
    ppLine41: TppLine;
    ppDBText16: TppDBText;
    myDBCheckBox1: TmyDBCheckBox;
    ppLabel13: TppLabel;
    myDBCheckBox2: TmyDBCheckBox;
    ppLabel14: TppLabel;
    myDBCheckBox3: TmyDBCheckBox;
    myDBCheckBox4: TmyDBCheckBox;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppLine7: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine8: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel17: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine11: TppLine;
    ppLine16: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    vrkey0010:Integer;
    code3:string;
  public
    { Public declarations }
  end;

var
  Form_SoPrint: TForm_SoPrint;

implementation

uses demo,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TForm_SoPrint.FormShow(Sender: TObject);
begin
 dm.AQ0493.Close;
 DM.AQ0493.Open;
end;

procedure TForm_SoPrint.Button2Click(Sender: TObject);
begin
 Close;
end;

procedure TForm_SoPrint.Button1Click(Sender: TObject);
begin
 if Trim(Edit1.Text)='' then
 begin
   MessageDlg('请先选择客户!',mtInformation,[mbOK],1);
   Exit;
 end;
 adoquery1.Close;
 adoquery1.Parameters.ParamByName('dtpk1').Value:=dtpk1.Date;
 adoquery1.Parameters.ParamByName('dtpk2').Value:=dtpk2.Date;
 ADOQuery1.Parameters.ParamByName('rkey10').Value:=vrkey0010;
 adoquery1.Prepared;
 adoquery1.Open;
 if adoquery1.IsEmpty then showmessage('对不起没有找到符合条件的订单')
 else
 button3.Enabled:=true;
end;

procedure TForm_SoPrint.Button3Click(Sender: TObject);
begin
  ppReport1.Reset;
  ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'much_soprint.rtm';     
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TForm_SoPrint.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 if ADOQuery1so_oldnew.Value='新单' then
 ADOQuery1isNew.Value:=True
 else
 ADOQuery1isNew.Value:=False;
 
 if ADOQuery1so_oldnew.Value='旧单' then
 begin
  ADOQuery1isOld.Value:=True;
  if ADOQuery1is_alter.Value=1 then // 资料有改动
  ADOQuery1isalter.Value:=True
  else
  ADOQuery1isalter.Value:=False;

  if ADOQuery1is_alter.Value=0 then // 按以前资料
  ADOQuery1noalter.Value:=True
  else
  ADOQuery1noalter.Value:=False;
 end
 else
 begin
  ADOQuery1isOld.Value:=False;
  ADOQuery1isalter.Value:=False;
  ADOQuery1noalter.Value:=False;
 end;
end;

procedure TForm_SoPrint.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADOQuery1.SQL.Text);
end;

procedure TForm_SoPrint.FormCreate(Sender: TObject);
begin
 if (StrToInt(vprev)=1) or (StrToInt(vprev)=2) then
 begin
  ADOQuery1.SQL.Text:=ADOQuery1.SQL.Text+'and data0010.rkey in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+') order by data0213.manu_part_number';
 end
 else
 begin
  ADOQuery1.SQL.Text:=ADOQuery1.SQL.Text+'order by data0213.manu_part_number';
 end;
end;

procedure TForm_SoPrint.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'CUST_CODE/客户代码/100,ABBR_NAME/客户简称/100,CUSTOMER_NAME/客户名称/200';
    if (StrToInt(vprev)=3) or (StrToInt(vprev)=4) then
    begin
    InputVar.Sqlstr := 'select RKEY,CUST_CODE,ABBR_NAME,CUSTOMER_NAME,ANALYSIS_CODE3 from data0010 '+
                       'order by CUST_CODE';
    end
    else
    begin
    InputVar.Sqlstr := 'select RKEY,CUST_CODE,ABBR_NAME,CUSTOMER_NAME,ANALYSIS_CODE3 from data0010 '+
                       'where rkey in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+')'+
                       'order by CUST_CODE ';
    end;
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      vrkey0010 :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      edit1.Text := frmPick_Item_Single.adsPick.FieldValues['CUST_CODE'];
      CODE3:= frmPick_Item_Single.adsPick.Fieldbyname('ANALYSIS_CODE3').AsString;
     end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

procedure TForm_SoPrint.Edit1Exit(Sender: TObject);
begin
  if trim(edit1.Text)='' then
    BEGIN
      vrkey0010 := 0 ;
      exit ;
    END ;
  if ActiveControl =bitbtn3 then exit;

  if dm.ADOQuery1.Active then dm.ADOQuery1.Close ;
  dm.ADOQuery1.SQL.Clear;
  dm.ADOQuery1.SQL.Add('select RKEY,CUST_CODE,CUSTOMER_NAME,ANALYSIS_CODE3');
  if (StrToInt(vprev)=3) or (StrToInt(vprev)=4) then
  begin
  dm.ADOQuery1.SQL.Add('from Data0010 where CUST_CODE ='''+edit1.Text+'''');
  end
  else
  begin
  dm.ADOQuery1.SQL.Add('from Data0010 where rkey in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+')'+'and CUST_CODE ='''+edit1.Text+'''');
  end;
  dm.ADOQuery1.Prepared ;
  dm.ADOQuery1.Open ;
  if dm.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到该客户代号！',mtinformation,[mbok],0);
      edit1.SetFocus ;
    end
  else
    begin
       vrkey0010 :=  dm.ADOQuery1.FieldValues['RKEY'];
       edit1.Text := dm.ADOQuery1.FieldValues['CUST_CODE'];
       CODE3:=  dm.ADOQuery1.Fieldbyname('ANALYSIS_CODE3').AsString;
    end;
  dm.ADOQuery1.Close ;
end;

procedure TForm_SoPrint.DBGrid2DblClick(Sender: TObject);
begin
  if not ADOQuery1.IsEmpty then ADOQuery1.Delete;
  if ADOQuery1.IsEmpty then
  begin
   button3.Enabled:=false;
  end;
end;

end.
