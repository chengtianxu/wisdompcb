{******************************************************************************}
{                                                                              }
{Writen by: Jacky Zhong                                                        }
{Date: MAR. 27. 2007                                                           }
{Comments:材料进出存查询的入口                                                 }
{1.定义了材料进出存的7个查询选择,提供每个查询的条件设置,并返回查询数据         }
{继承:     TfrmQuery_Param -->  TfrmMatrlInOut                                 }
{                                                                              }
{                                                                              }
{******************************************************************************}

unit MatrlInOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Query_Param,  DBClient, Grids, DBGridEh, RzTabs, RzButton,
  ExtCtrls, RzPanel, RzRadGrp,QryDynamicModel, StdCtrls, DB;

type
  TfrmMatrlInOut = class(TfrmQuery_Param)
    rgObject: TRzRadioGroup;
    rgGroupType: TRzRadioGroup;
    procedure spbtnExecClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgObjectChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure rgGroupTypeChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    qryNo:integer;
    pForm1 ,pForm2,pForm3,pForm4,pForm5,pForm6,pForm7 : TfrmQryDynamicModel;
    FormWidth,FormHeight:integer;
    procedure OnFormClose(Sender: TObject; var Action: TCloseAction);
  public
    { Public declarations }
    procedure OpenQryFields(iObject,iType:integer);
  end;

var
  frmMatrlInOut: TfrmMatrlInOut;

implementation
uses ConstDeclare,Client_Func,PUBFunc,QryMatrlReceiving;
{$R *.dfm}

{ TfrmMatrlInOut }


{ TfrmMatrlInOut }

procedure TfrmMatrlInOut.OpenQryFields(iObject,iType:integer);
begin
  FormWidth:= frmMatrlInOut.Width;
  FormHeight:=frmMatrlInOut.Height;
  case iType of
    0 :
       begin
         case iObject of
           0 : qryNo:=qry_Matrl_receiving_List;
           1 : qryNo:=qry_Matrl_Issue_List;
           2 : qryNo:=qry_Matrl_Stock_List;
           3 : qryNo:=qry_Matrl_ReMove;
         end
       end;
    1 :
       begin
         case iObject of
           0 : qryNo:=qry_Matrl_receiving_Sum;
           1 : qryNo:=qry_Matrl_Issue_Sum;
           2 : qryNo:=qry_Matrl_Stock_Sum;
           3 : qryNo:=qry_Matrl_ReMove;
         end
       end;
  end;
  InitForm(qryNo);
end;

procedure TfrmMatrlInOut.spbtnExecClick(Sender: TObject);
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
    qry_Matrl_receiving_List :
                              if not Assigned(pForm1) then
                              begin
                                pForm1 := TfrmQryDynamicModel.Create(application);
                                pForm1.Caption := '材料接收清单';
                                pForm1.onClose := OnFormClose;
                                pForm1.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm1.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm1.BringToFront;

    qry_Matrl_receiving_Sum  :
                              if not Assigned(pForm2) then
                              begin
                                pForm2 := TfrmQryDynamicModel.Create(application);
                                pForm2.Caption := '材料接收汇总';
                                pForm2.onClose := OnFormClose;
                                pForm2.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm2.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm2.BringToFront;

    qry_Matrl_Issue_List     :
                              if not Assigned(pForm3) then
                              begin
                                pForm3 := TfrmQryDynamicModel.Create(application);
                                pForm3.Caption := '材料发放清单';
                                pForm3.onClose := OnFormClose;
                                pForm3.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm3.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm3.BringToFront;
    qry_Matrl_Issue_Sum      :
                              if not Assigned(pForm4) then
                              begin
                                pForm4 := TfrmQryDynamicModel.Create(application);
                                pForm4.Caption := '材料发放汇总';
                                pForm4.onClose := OnFormClose;
                                pForm4.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm4.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm4.BringToFront;
    qry_Matrl_Stock_List     :
                              if not Assigned(pForm5) then
                              begin
                                pForm5 := TfrmQryDynamicModel.Create(application);
                                pForm5.Caption := '材料库存清单';
                                pForm5.onClose := OnFormClose;
                                pForm5.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm5.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm5.BringToFront;
    qry_Matrl_Stock_Sum      :
                              if not Assigned(pForm6) then
                              begin
                                pForm6 := TfrmQryDynamicModel.Create(application);
                                pForm6.Caption := '材料库存汇总';
                                pForm6.onClose := OnFormClose;
                                pForm6.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm6.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm6.BringToFront;
    qry_Matrl_ReMove         ://材料库存
                              if not Assigned(pForm7) then
                              begin
                                pForm7 := TfrmQryDynamicModel.Create(application);
                                pForm7.Caption := '材料转移清单';
                                pForm7.onClose := OnFormClose;
                                pForm7.StatusBar1.Panels[2].Text := '共耗时: '+FloatToStr(D)+'秒';
                                pForm7.InitForm(qryNo,cdsItems.Data,vData);
                              end
                              else
                                pForm7.BringToFront;
 end;
end;

procedure TfrmMatrlInOut.FormClose(Sender: TObject;
  var Action: TCloseAction);
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
  if pForm5 <> nil then
    pForm5.Free;
  if pForm6 <> nil then
    pForm6.Free;
  if pForm7 <> nil then
    pForm7.Free;
  Action := cafree;
  frmMatrlInOut := nil;
end;

procedure TfrmMatrlInOut.rgObjectChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  inherited;
  rgGroupType.Visible := NewIndex <3;
  OpenQryFields(NewIndex,rgGroupType.ItemIndex);
end;

procedure TfrmMatrlInOut.rgGroupTypeChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  inherited;
  OpenQryFields(rgObject.ItemIndex,NewIndex);
end;

procedure TfrmMatrlInOut.OnFormClose(Sender: TOBject;
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
  if pForm5 <> nil then
    pForm5 := nil;
  if pForm6 <> nil then
    pForm6 := nil;
  if pForm7 <> nil then
    pForm7 := nil;
end;

procedure TfrmMatrlInOut.FormActivate(Sender: TObject);
begin
  inherited;
  self.WindowState := wsNormal;
end;

procedure TfrmMatrlInOut.Button1Click(Sender: TObject);
begin
  inherited;
//  Export_Grid_Column_To_Text(IntToStr(QryNo),'Fields.txt',dbgrid2);
end;

end.

