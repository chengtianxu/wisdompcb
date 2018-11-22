unit ReturnFrm_Mod01;

interface

uses
 // Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
 // Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,uBaseEditFrm,Vcl.Mask, RzEdit,
  RzBtnEdt, uRKeyBtnEdit,uCommFunc, Vcl.DBCtrls,uBaseSinglePickListFrm,
  Vcl.ComCtrls,DBTables ;

type
  TAfterUpdate_Mod02 = procedure(ACds : TClientDataSet) of object;





  TFrmReturn_Mod01 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    MaskEdit1: TMaskEdit;
    bar1: TStatusBar;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    cds_01: TClientDataSet;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit6Exit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    Ftag :Integer;
    c_code1 : string;
    FAfterUpdate : TAfterUpdate_Mod02;
    procedure getdate(ARkey:string);
    procedure bindingfield;
    { Public declarations }
  end;

var
  FrmReturn_Mod01: TFrmReturn_Mod01;

implementation

{$R *.dfm}

uses MainFrm_Mod01;



procedure TFrmReturn_Mod01.btnCloseClick(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TFrmReturn_Mod01.btnSaveClick(Sender: TObject);
var
  LPostData : OleVariant;
  Lsql : string;
  lcds : TClientDataSet;
begin
    inherited;
    if Trim(Edit6.Text) = '' then
      begin
        ShowMessage('货币代码不能为空!');
        Exit;
      end;
    if Trim(Edit1.Text) = '' then
      begin
        ShowMessage('货币名称不能为空!');
        Exit;
      end;


     Lsql := 'select * from data0001 where CURR_CODE='+ QuotedStr(Trim(Edit6.Text)) ;
     lcds := TClientDataSet.Create(Self);   //货币代码是否重复
     gSvrIntf.IntfGetDataBySql(Lsql,lcds);
      try
       // ShowMessage(c_code1);
         if Ftag =2 then
          begin
            if c_code1 <> Edit6.Text  then
             begin
               if (not lcds.IsEmpty) then
                begin
                   ShowMessage('货币代码重复');
                   Exit;
                end;
             end ;
          end;
        if (Ftag =1 ) or (Ftag = 3) then
          begin
            if (not lcds.IsEmpty) then
              begin
                ShowMessage('货币代码重复');
                Exit;
              end;
          end;
      finally
          lcds.Free;
      end;


        case Ftag of
           1:  //新增
            begin

               cds_01.Append;
               cds_01.FieldByName('CURR_CODE').Value := Trim(Edit6.Text);
               cds_01.FieldByName('CURR_NAME').Value := Trim(Edit1.Text);
               cds_01.FieldByName('EXCH_RATE').Value := Trim(Edit2.Text);
               cds_01.FieldByName('BASE_TO_OTHER').Value := Trim(Edit3.Text);
               cds_01.FieldByName('QTE_EXCH_RATE').Value := Trim(Edit4.Text);
               cds_01.FieldByName('QTE_BASE_TO_OTHER').Value := Trim(Edit5.Text);
               cds_01.FieldByName('QUOTE_BASED').Value := '0';
               cds_01.FieldByName('TDATE').Value := Trim(MaskEdit1.Text);
               cds_01.Post;
            end;
           2: //编辑
            begin
               cds_01.Edit;
               cds_01.FieldByName('CURR_CODE').Value := Trim(Edit6.Text);
               cds_01.FieldByName('CURR_NAME').Value := Trim(Edit1.Text);
               cds_01.FieldByName('EXCH_RATE').Value := Trim(Edit2.Text);
               cds_01.FieldByName('BASE_TO_OTHER').Value := Trim(Edit3.Text);
               cds_01.FieldByName('QTE_EXCH_RATE').Value := Trim(Edit4.Text);
               cds_01.FieldByName('QTE_BASE_TO_OTHER').Value := Trim(Edit5.Text);
               cds_01.FieldByName('QUOTE_BASED').Value := '0';
               cds_01.FieldByName('TDATE').Value := Trim(MaskEdit1.Text);
               cds_01.Post;
            end;
          3:  //复制
            begin
               cds_01.Append;
               cds_01.FieldByName('CURR_CODE').Value := Trim(Edit6.Text);
               cds_01.FieldByName('CURR_NAME').Value := Trim(Edit1.Text);
               cds_01.FieldByName('EXCH_RATE').Value := Trim(Edit2.Text);
               cds_01.FieldByName('BASE_TO_OTHER').Value := Trim(Edit3.Text);
               cds_01.FieldByName('QTE_EXCH_RATE').Value := Trim(Edit4.Text);
               cds_01.FieldByName('QTE_BASE_TO_OTHER').Value := Trim(Edit5.Text);
               cds_01.FieldByName('QUOTE_BASED').Value := '0';
               cds_01.FieldByName('TDATE').Value := Trim(MaskEdit1.Text);
               cds_01.Post;
            end;
        end ;

     if cds_01.State in [dsEdit,dsInsert] then cds_01.Post;

    LPostData := VarArrayCreate([0,1],varVariant);
    if cds_01.ChangeCount > 0 then
        LPostData[0] := cds_01.Delta;
    // IF gSvrIntf.IntfPostDataByTable('data0001',cds_insert.Delta) then
   if gSvrIntf.IntfPostModData('公共基础',225,LPostData) then
      begin
        cds_01.MergeChangeLog;
        showmessage('保存成功');
        if Assigned(FAfterUpdate) then
          FAfterUpdate(nil);
        Close;
      end;

end;

procedure TFrmReturn_Mod01.Edit2Click(Sender: TObject);
begin
  inherited;
  (Sender as TEdit).SelectAll;
end;

procedure TFrmReturn_Mod01.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9','.',#8]) then  Abort
  else
    if Key=chr(46) then //不允许重复输入‘,’
    if Pos('.',(sender as TEdit).text)<>0 then
      Abort;
end;

procedure TFrmReturn_Mod01.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Edit2.Text <> '' then
    if StrToFloat(Edit2.Text) > 0 then
      Edit3.Text := Format('%.8f',[1/strtofloat(Edit2.Text)])
    else
      Edit3.Text := '0.00000000'
  else
    Edit2.Text := '0.00000000';
end;

procedure TFrmReturn_Mod01.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Edit3.Text <> '' then
    if StrToFloat(Edit3.Text) > 0 then
      Edit2.Text := Format('%.8f',[1/strtofloat(Edit3.Text)])
    else
      Edit2.Text := '0.00000000'
  else
      Edit3.Text := '0.00000000';
end;

procedure TFrmReturn_Mod01.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Edit4.Text <> '' then
    if StrToFloat(Edit4.Text) > 0 then
      Edit5.Text := Format('%.8f',[1/strtofloat(Edit4.Text)])
    else
      Edit5.Text := '0.00000000'
  else
      Edit4.Text := '0.00000000';
end;

procedure TFrmReturn_Mod01.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Edit5.Text <> '' then
    if StrToFloat(Edit5.Text) > 0 then
      Edit4.Text := Format('%.8f',[1/strtofloat(Edit5.Text)])
    else
      Edit4.Text := '0.00000000'
  else
      Edit5.Text := '0.00000000';
end;

procedure TFrmReturn_Mod01.Edit6Exit(Sender: TObject);
begin
  inherited;
   Edit7.Text := Trim(Edit6.Text) + '/本位币';
   Edit8.Text := '本位币/'+Trim(Edit6.Text);
   Edit9.Text := Trim(Edit6.Text) + '/本位币';
   Edit10.Text := '本位币/'+Trim(Edit6.Text);
end;

procedure TFrmReturn_Mod01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
     Action := caFree;
     FrmReturn_Mod01 := nil;
end;

procedure TFrmReturn_Mod01.getdate(ARkey: string);
var
  Lsql : string;
begin
   Lsql := 'select * from data0001 where rkey='+ARkey;
   gSvrIntf.IntfGetDataBySql(Lsql,cds_01);
end;


procedure TFrmReturn_Mod01.MaskEdit1Exit(Sender: TObject);
var  d_time: TDatetime;
begin
  inherited;
   if not TryStrToDateTime(MaskEdit1.Text,d_time) then
    begin
       MessageDlg('日期格式录入有误',mtinformation,[mbok],0);
       MaskEdit1.SetFocus;
    end;

end;

procedure TFrmReturn_Mod01.bindingfield;
begin
  FrmReturn_Mod01.Edit6.Text := cds_01.FieldByName('CURR_CODE').AsString;  //货币代码
  FrmReturn_Mod01.Edit1.Text := cds_01.FieldByName('CURR_NAME').AsString;  //货币名称
  FrmReturn_Mod01.Edit2.Text := Format('%.8f',[cds_01.FieldByName('EXCH_RATE').AsFloat]);  //记账汇率
  FrmReturn_Mod01.Edit3.Text := Format('%.8f',[cds_01.FieldByName('BASE_TO_OTHER').AsFloat]);  //相对记账汇率
  FrmReturn_Mod01.Edit4.Text := Format('%.8f',[cds_01.FieldByName('QTE_EXCH_RATE').AsFloat]); //报价汇率
  FrmReturn_Mod01.Edit5.Text := Format('%.8f',[cds_01.FieldByName('QTE_BASE_TO_OTHER').AsFloat]); //相对报价汇率
  FrmReturn_Mod01.MaskEdit1.Text := FormatDateTime('yyyy-mm-dd',cds_01.FieldByName('TDATE').Value);
end;

end.
