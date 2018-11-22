unit MAINMenu;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, DB, ADODB;

type
  TMainForm = class(TForm)
    ToolBar2: TToolBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Production1: TMenuItem;
    Help1: TMenuItem;
    Item_Help: TMenuItem;
    StatusBar: TStatusBar;
    N2: TMenuItem;
    N3: TMenuItem;
    SpeedButton2: TSpeedButton;
    db_ptr: TLabel;
    N4: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Production1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Item_HelpClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
  private
    procedure ShowHint(Sender:TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses mater_Report, Report2, DataModule, Report1, report3, report4, report5,
  report6, report7, report8, report9, report10, Report12,
  Report13, Report14, Report15, Report16, desi_report, desi_reportmic,
  desi_o_report, desi_o_reportmic, sales_order, Mreport,
  t_report, report_comein, report_mrb, much_so, customer_info,
  shipadvice_report,common;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);

begin
 if not app_init_2(dm.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
 self.Caption:=application.Title;
  Application.Onhint:=ShowHInt;
end;

procedure TMainForm.ShowHint(Sender:TObject);
begin
  StatusBar.SimpleText:=Application.Hint;
end;


procedure TMainForm.FormResize(Sender: TObject);
begin
  ToolBar2.Width :=width-8;
  StatusBar.Width :=width-8;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.Production1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport, FrmReport);
  FrmReport.ppDesigner1.ShowModal ;
  FrmReport.Free ;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport4, FrmReport4);
  FrmReport4.ppDesigner2.Showmodal;
  FrmReport4.Free ;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 if  dm.Adoconnection1.Connected then
  begin

  end;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport5, FrmReport5);
  FrmReport5.ppDesigner3.ShowModal ;
  FrmReport5.Free ;
end;

procedure TMainForm.Item_HelpClick(Sender: TObject);
begin
  dm.Aq53.Open;
  Application.CreateForm(TFrmReport1, FrmReport1);
  FrmReport1.ppDesigner1.ShowModal ;
  FrmReport1.Free ;
  dm.Aq53.Close;
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport6, FrmReport6);
  FrmReport6.ppDesigner2.ShowModal ;
  FrmReport6.Free;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport7, FrmReport7);
  FrmReport7.ppDesigner3.ShowModal ;
  FrmReport7.Free;
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport2, FrmReport2);
  FrmReport2.ppDesigner1.ShowModal ;
  FrmReport2.Free;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport8, FrmReport8);
  FrmReport8.ppDesigner2.ShowModal ;
  FrmReport8.Free;
end;

procedure TMainForm.N11Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport9, FrmReport9);
  FrmReport9.ppDesigner3.ShowModal ;
  FrmReport9.Free;
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport10, FrmReport10);
  FrmReport10.ppDesigner4.ShowModal ;
  FrmReport10.Free;
end;

procedure TMainForm.N17Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport12, FrmReport12);
  FrmReport12.ppDesigner1.ShowModal ;
  FrmReport12.Free;
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport13, FrmReport13);
  FrmReport13.ppDesigner1.ShowModal ;
  FrmReport13.Free;
end;

procedure TMainForm.N20Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport14, FrmReport14);
  FrmReport14.ppDesigner1.ShowModal ;
  FrmReport14.Free;
end;

procedure TMainForm.N21Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport15, FrmReport15);
  FrmReport15.ppDesigner1.ShowModal ;
  FrmReport15.Free;
end;

procedure TMainForm.N22Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport16, FrmReport16);
  FrmReport16.ppDesigner1.ShowModal ;
  FrmReport16.Free;
end;

procedure TMainForm.N26Click(Sender: TObject);
begin
 Application.CreateForm(Tform14,form14);
 form14.ppDesigner1.ShowModal ;
 Form14.Free;
end;

procedure TMainForm.N27Click(Sender: TObject);
begin
 Application.CreateForm(Tform15,form15);
 form15.ppDesigner1.ShowModal ;
 Form15.Free;
end;

procedure TMainForm.N28Click(Sender: TObject);
begin
 Application.CreateForm(Tform17,form17);
 form17.ppDesigner1.ShowModal ;
 Form17.Free;
end;

procedure TMainForm.N29Click(Sender: TObject);
begin
 Application.CreateForm(Tform18,form18);
 form18.ppDesigner1.ShowModal ;
 Form18.Free;
end;

procedure TMainForm.N31Click(Sender: TObject);
begin
 Application.CreateForm(Tform1,form1);
 form1.ppDesigner1.ShowModal ;
 Form1.Free;
end;

procedure TMainForm.N32Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport3, FrmReport3);
  FrmReport3.ppDesigner1.ShowModal ;
  FrmReport3.Free;
end;

procedure TMainForm.N33Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport3, FrmReport3);
  FrmReport3.ppDesigner3.ShowModal ;
  FrmReport3.Free;
end;

procedure TMainForm.N34Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport3, FrmReport3);
  FrmReport3.ppDesigner4.ShowModal ;
  FrmReport3.Free;
end;

procedure TMainForm.N35Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport3, FrmReport3);
  FrmReport3.ppDesigner5.ShowModal ;
  FrmReport3.Free;
end;

procedure TMainForm.N36Click(Sender: TObject);
begin
 Application.CreateForm(Tform_Mreport,form_Mreport);
 form_Mreport.ppDesigner1.ShowModal ;
 Form_Mreport.Free;
end;

procedure TMainForm.N38Click(Sender: TObject);
begin
 Application.CreateForm(Tform_trp,form_trp);
 form_trp.ppDesigner1.ShowModal ;
 form_trp.Free;
end;

procedure TMainForm.N39Click(Sender: TObject);
begin
 Application.CreateForm(TF_partin_report,F_partin_report);
 F_partin_report.ppDesigner1.ShowModal ;
 F_partin_report.Free;
end;

procedure TMainForm.N40Click(Sender: TObject);
begin
 Application.CreateForm(Tform_report,form_report);
 form_report.ppDesigner1.ShowModal ;
 form_report.Free;
end;

procedure TMainForm.N41Click(Sender: TObject);
begin
form_shipadvice:=tform_shipadvice.Create(application);
form_shipadvice.ppDesigner1.ShowModal;
form_shipadvice.Free;
end;

procedure TMainForm.N42Click(Sender: TObject);
begin
form_shipadvice:=tform_shipadvice.Create(application);
form_shipadvice.ppDesigner2.ShowModal;
form_shipadvice.Free;
end;

procedure TMainForm.N43Click(Sender: TObject);
begin
 Application.CreateForm(Tform3,form3);
 form3.ppDesigner1.ShowModal ;
 Form3.Free;
end;

procedure TMainForm.N45Click(Sender: TObject);
begin
 Application.CreateForm(Tform4,form4);
 form4.ppDesigner1.ShowModal ;
 Form4.Free;
end;

end.
