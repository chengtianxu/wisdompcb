unit POMatrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Query_Param, DBClient, Grids, DBGridEh, RzTabs, RzButton,
  ExtCtrls, RzPanel, RzRadGrp, QryDynamicModel, DB;

type
  TfrmPOMatrl = class(TfrmQuery_Param)
    rgObject: TRzRadioGroup;
    rgGroupType: TRzRadioGroup;
    RzBitBtn3: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure spbtnExecClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgObjectChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure rgGroupTypeChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure RzBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    qryNo:integer;
    pForm1 ,pForm2,pForm3,pForm4 : TfrmQryDynamicModel;
  public
    { Public declarations }
    procedure OnFormClose(Sender: TObject; var Action: TCloseAction);
    procedure OpenQryFields(iObject,iType:integer);
  end;

var
  frmPOMatrl: TfrmPOMatrl;

implementation
uses Client_Func,PUBFunc,ConstDeclare,Qry_PO_Summarizing,Dlg_Qry_PO_Sum;
{$R *.dfm}

procedure TfrmPOMatrl.OnFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if pForm1 <> nil then
    pForm1 := nil;
  if pForm2 <> nil then
    pForm2 := nil;
  if pForm3 <> nil then
    pForm3 := nil;
  if pForm4 <> nil then
    pForm4 := nil;
end;

procedure TfrmPOMatrl.RzBitBtn1Click(Sender: TObject);
begin
//  inherited;
//  Export_Grid_Column_To_Text('304','304.txt',DBGrid2)
end;

procedure TfrmPOMatrl.spbtnExecClick(Sender: TObject);
var
  ErrorMsg:Widestring;
  vData:OleVariant;
  sqlstr:string;
  D:double;
  i:integer;
begin
  i := GetTickCount;
  sqlstr := Get_Combine_Sql;
  if not coMyQuery.Get_Sql_Data_With_Compressed(sqlstr,vData,ErrorMsg) then
  begin
    ShowMsg('返回查询数据失败，请检查',1);
    abort;
  end
  else
    if not DeCompress_Data(vData) then
      ShowMsg('数据解压缩失败，请检查',1);
  if varIsEmpty(vData) then
  begin
    ShowMsg('没有找到记录，请检查',1);
    abort;
  end;
  cdsItems.First;
{  if not Assigned(frmQryMatrlReceiving) then
  begin
    frmQryMatrlReceiving := TfrmQryMatrlReceiving.Create(application);
    frmQryMatrlReceiving.InitForm(qryNo,cdsItems.Data,vData);
//    frmQry250.show;
  end
  else
    frmQryMatrlReceiving.BringToFront;
 }
  D := (GetTickCount - i)/1000;

  case qryNo of
    qry_Prchs_Req_Matrl_Prod :
                              if not Assigned(pForm1) then
                              begin
                                pForm1 := TfrmQryDynamicModel.Create(application);
                                pForm1.Caption := '生产物料请购列表';
                                pForm1.onClose := OnFormClose;
                                pForm1.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm1.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm1.BringToFront;

    qry_Prchs_Req_Matrl_Other  :
                              if not Assigned(pForm2) then
                              begin
                                pForm2 := TfrmQryDynamicModel.Create(application);
                                pForm2.Caption := '非生产物料请购列表';
                                pForm2.onClose := OnFormClose;
                                pForm2.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm2.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm2.BringToFront;

    qry_Prchs_Matrl_Prod     :
                              if not Assigned(pForm3) then
                              begin
                                pForm3 := TfrmQryDynamicModel.Create(application);
                                pForm3.Caption := '生产物料采购列表';
                                pForm3.onClose := OnFormClose;
                                pForm3.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm3.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm3.BringToFront;
    qry_Prchs_Matrl_Other      :
                              if not Assigned(pForm4) then
                              begin
                                pForm4 := TfrmQryDynamicModel.Create(application);
                                pForm4.Caption := '非生产物料采购列表';
                                pForm4.onClose := OnFormClose;
                                pForm4.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm4.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm4.BringToFront;
 end;
end;

procedure TfrmPOMatrl.FormActivate(Sender: TObject);
begin
  inherited;
  self.WindowState := wsNormal;
end;

procedure TfrmPOMatrl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if pForm1 <> nil then
    pForm1.Free;
  if pForm2 <> nil then
    pForm2.Free;
  if pForm3 <> nil then
    pForm3.Free;
  if pForm4 <> nil then
    pForm4.Free;
  Action := cafree;
  frmPOMatrl := nil;
end;

procedure TfrmPOMatrl.OpenQryFields(iObject, iType: integer);
begin
  case iObject of
    0 :
       begin
         case iType of
           0 : qryNo:=qry_Prchs_Req_Matrl_Prod;
           1 : qryNo:=qry_Prchs_Req_Matrl_Other;
         end
       end;
    1 :
       begin
         case iType of
           0 : qryNo:=qry_Prchs_Matrl_Prod;
           1 : qryNo:=qry_Prchs_Matrl_Other;
         end
       end;
  end;
  InitForm(qryNo);
end;

procedure TfrmPOMatrl.rgObjectChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  inherited;
  OpenQryFields(NewIndex,rgGroupType.ItemIndex);
end;

procedure TfrmPOMatrl.rgGroupTypeChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  inherited;
  OpenQryFields(rgObject.ItemIndex,NewIndex);
end;

procedure TfrmPOMatrl.RzBitBtn3Click(Sender: TObject);
var
  vData:Olevariant;
  ErrorMsg:Widestring;
  rslt:boolean;
  qryNo:integer;
  i:integer;
  D:double;
begin
  i := GetTickCount;
  inherited;
  with TfrmDlg_Qry_PO_Sum.Create(Application)do
  try
    if ShowModal = mrok then
    begin
      if RadioGroup1.ItemIndex = 0 then
        qryNo:= qry_Prchs_summarizing
      else
        qryNo:= qry_Prchs_Stock_summarizing;
      if ComboBox1.ItemIndex<>ComboBox1.Items.Count-1 then //带工厂
        rslt:=coMyQuery.Po_Matrl_Analyze(RadioGroup1.ItemIndex,vData,ErrorMsg,DTpk1.Date,DTpk2.Date,cdsFactory.fieldByName('rKey').value,qryno)
      else
        rslt:=coMyQuery.Po_Matrl_Analyze(RadioGroup1.ItemIndex,vData,ErrorMsg,DTpk1.Date,DTpk2.Date,100,qryno); //100代表所有工厂

      D := (GetTickCount - i)/1000;
      if rslt then
      begin
    {    if not DeCompress_Data(vData) then
        begin
          ShowMsg('数据解压缩失败，请检查',1);
          exit;
        end;}
        if not Assigned(frmQry_PO_Summarizing) then
          frmQry_PO_Summarizing := TfrmQry_PO_Summarizing.Create(application);
        frmQry_PO_Summarizing.bDate := DTpk1.Date;
        frmQry_PO_Summarizing.eDate := DTpk2.Date;
        frmQry_PO_Summarizing.iType := RadioGroup1.ItemIndex;
        if ComboBox1.ItemIndex<>ComboBox1.Items.Count-1 then //带工厂
          frmQry_PO_Summarizing.iFactory := cdsFactory.fieldByName('rKey').value
        else
          frmQry_PO_Summarizing.iFactory := 100;
        frmQry_PO_Summarizing.pQryNo := qryNo;
        frmQry_PO_Summarizing.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
        frmQry_PO_Summarizing.InitForm(QryNo,vData);
      end
      else
        ShowMsg('异常错误: '+ErrorMsg,1);


    end;
  finally
    free;
  end;
(*  if rslt then
  begin
{    if not DeCompress_Data(vData) then
    begin
      ShowMsg('数据解压缩失败，请检查',1);
      exit;
    end;}
    if not Assigned(frmQry_PO_Summarizing) then
    begin
      frmQry_PO_Summarizing := TfrmQry_PO_Summarizing.Create(application);
      frmQry_PO_Summarizing.InitForm(QryNo,vData);
    end
    else
      frmQry_PO_Summarizing.BringToFront;
  end
  else
    ShowMsg('异常错误: '+ErrorMsg,1);
    *)
end;

end.
