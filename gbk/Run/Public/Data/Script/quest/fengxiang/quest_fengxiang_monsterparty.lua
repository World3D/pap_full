--�����ܶ�Ա����
--��ľ��2�ܱ�
--MisDescBegin
--�ű���
x700000_g_ScriptId = 700000
--��һ�������ID
--g_MissionIdPre =
--�����
x700000_g_MissionId = 25
--����Ŀ��npc
x700000_g_Name	="��ľ��" 
--�������
x700000_g_MissionKind = 1
--����ȼ�
x700000_g_MissionLevel = 1
--�Ƿ��Ǿ�Ӣ����
x700000_g_IfMissionElite = 0
--���漸���Ƕ�̬��ʾ������,�����������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x700000_g_IsMissionOkFail = 0		--�����ĵ�0λ
--������Ҫɱ���Ĺ�
--x700000_g_DemandKill ={{id=500,num=5}}		--������1λ
--�����Ƕ�̬**************************************************************
--�����ı�����
x700000_g_MissionName="�����ܶ�Ա"
x700000_g_MissionInfo="������Ϊ����ѡ����ǿ��,��ͬ���һͳ���µİ�ҵ,��Ҫ������ս��"  --��������
x700000_g_MissionTarget="ͨ������������ս,ͨ��20�ذɣ�"		--����Ŀ��
x700000_g_ContinueInfo="���ͨ����սȥ�ɣ�"		--δ����������ľ���npc�Ի�
x700000_g_TargetContinueInfo="��������ս����"		--���ܱ�ĶԻ�
x700000_g_MissionComplete="��ȡ��Ӧ�õĽ����ɣ�"					--�������ʱ���˵���Ļ�

--MisDescEnd

--���������Ϣ����
x700000_g_CopySceneType=FUBEN_MONSTERPARTY	--�������ͣ�������ScriptGlobal.lua����
x700000_g_LimitMembers=1			--���Խ���������С��������
x700000_g_TickTime=5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x700000_g_LimitTotalHoldTime=360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x700000_g_LimitTimeSuccess=500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������

x700000_g_startTickCount = 2;				--��ʼ���ֵ�ʱ�䣨��λ���Σ�

x700000_g_CloseTick=3600				--�����ر�ǰ����ʱ����λ��������
x700000_g_NoUserTime=5			--������û���˺���Լ��������ʱ�䣨��λ���룩
x700000_g_DeadTrans=1				--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x700000_g_Fuben_X=10				--���븱����λ��X
x700000_g_Fuben_Z=16				--���븱����λ��Z
x700000_g_Back_X=48				--Դ����λ��X
x700000_g_Back_Z=220					--Դ����λ��Z
x700000_g_TotalNeedKill=100			--��Ҫɱ����������


--������
--������ҽ�����ʱ��ͬ�ȼ���,��ͨ����ͬ�ؿ�����,��ò�ͬ����
--�����ǲ�ͬ�ȼ��׶ν�����Ϸʱ����ɲ�ͬ�ؿ�ʱ����õľ��齱����
--lv=level(�ؿ�),exp=���ؾ��齱��						
explist1 = {{lv = 1, exp = 12},
						{lv = 2, exp = 36},
						{lv = 3, exp = 96},
						{lv = 4, exp = 120},
						{lv = 5, exp = 216},						
						{lv = 6, exp = 288},
						{lv = 7, exp = 408},
						{lv = 8, exp = 504},
						{lv = 9, exp = 648},
						{lv = 10, exp = 888},
						{lv = 11, exp = 1164},
						{lv = 12, exp = 1488},
						{lv = 13, exp = 1848},
						{lv = 14, exp = 2244},
						{lv = 15, exp = 2340},
						{lv = 16, exp = 2448},
						{lv = 17, exp = 2568},
						{lv = 18, exp = 3048},
						{lv = 19, exp = 3708},
						{lv = 20, exp = 4116}}
						
explist2 = {{lv = 1, exp = 12},
						{lv = 2, exp = 36},
						{lv = 3, exp = 96},
						{lv = 4, exp = 120},
						{lv = 5, exp = 216},						
						{lv = 6, exp = 288},
						{lv = 7, exp = 408},
						{lv = 8, exp = 504},
						{lv = 9, exp = 648},
						{lv = 10, exp = 888},
						{lv = 11, exp = 1164},
						{lv = 12, exp = 1488},
						{lv = 13, exp = 1848},
						{lv = 14, exp = 2244},
						{lv = 15, exp = 2340},
						{lv = 16, exp = 2448},
						{lv = 17, exp = 2568},
						{lv = 18, exp = 3048},
						{lv = 19, exp = 3708},
						{lv = 20, exp = 4116}}
						
explist3 = {{lv = 1, exp = 12},
						{lv = 2, exp = 36},
						{lv = 3, exp = 96},
						{lv = 4, exp = 120},
						{lv = 5, exp = 216},						
						{lv = 6, exp = 288},
						{lv = 7, exp = 408},
						{lv = 8, exp = 504},
						{lv = 9, exp = 648},
						{lv = 10, exp = 888},
						{lv = 11, exp = 1164},
						{lv = 12, exp = 1488},
						{lv = 13, exp = 1848},
						{lv = 14, exp = 2244},
						{lv = 15, exp = 2340},
						{lv = 16, exp = 2448},
						{lv = 17, exp = 2568},
						{lv = 18, exp = 3048},
						{lv = 19, exp = 3708},
						{lv = 20, exp = 4116}}
						
explist4 = {{lv = 1, exp = 12},
						{lv = 2, exp = 36},
						{lv = 3, exp = 96},
						{lv = 4, exp = 120},
						{lv = 5, exp = 216},						
						{lv = 6, exp = 288},
						{lv = 7, exp = 408},
						{lv = 8, exp = 504},
						{lv = 9, exp = 648},
						{lv = 10, exp = 888},
						{lv = 11, exp = 1164},
						{lv = 12, exp = 1488},
						{lv = 13, exp = 1848},
						{lv = 14, exp = 2244},
						{lv = 15, exp = 2340},
						{lv = 16, exp = 2448},
						{lv = 17, exp = 2568},
						{lv = 18, exp = 3048},
						{lv = 19, exp = 3708},
						{lv = 20, exp = 4116}}
						
explist5 = {{lv = 1, exp = 12},
						{lv = 2, exp = 36},
						{lv = 3, exp = 96},
						{lv = 4, exp = 120},
						{lv = 5, exp = 216},						
						{lv = 6, exp = 288},
						{lv = 7, exp = 408},
						{lv = 8, exp = 504},
						{lv = 9, exp = 648},
						{lv = 10, exp = 888},
						{lv = 11, exp = 1164},
						{lv = 12, exp = 1488},
						{lv = 13, exp = 1848},
						{lv = 14, exp = 2244},
						{lv = 15, exp = 2340},
						{lv = 16, exp = 2448},
						{lv = 17, exp = 2568},
						{lv = 18, exp = 3048},
						{lv = 19, exp = 3708},
						{lv = 20, exp = 4116}}
						
explist6 = {{lv = 1, exp = 12},
						{lv = 2, exp = 36},
						{lv = 3, exp = 96},
						{lv = 4, exp = 120},
						{lv = 5, exp = 216},						
						{lv = 6, exp = 288},
						{lv = 7, exp = 408},
						{lv = 8, exp = 504},
						{lv = 9, exp = 648},
						{lv = 10, exp = 888},
						{lv = 11, exp = 1164},
						{lv = 12, exp = 1488},
						{lv = 13, exp = 1848},
						{lv = 14, exp = 2244},
						{lv = 15, exp = 2340},
						{lv = 16, exp = 2448},
						{lv = 17, exp = 2568},
						{lv = 18, exp = 3048},
						{lv = 19, exp = 3708},
						{lv = 20, exp = 4116}}
						
explist7 = {{lv = 1, exp = 12},
						{lv = 2, exp = 36},
						{lv = 3, exp = 96},
						{lv = 4, exp = 120},
						{lv = 5, exp = 216},						
						{lv = 6, exp = 288},
						{lv = 7, exp = 408},
						{lv = 8, exp = 504},
						{lv = 9, exp = 648},
						{lv = 10, exp = 888},
						{lv = 11, exp = 1164},
						{lv = 12, exp = 1488},
						{lv = 13, exp = 1848},
						{lv = 14, exp = 2244},
						{lv = 15, exp = 2340},
						{lv = 16, exp = 2448},
						{lv = 17, exp = 2568},
						{lv = 18, exp = 3048},
						{lv = 19, exp = 3708},
						{lv = 20, exp = 4116}}
						
explist8 = {{lv = 1, exp = 12},
						{lv = 2, exp = 36},
						{lv = 3, exp = 96},
						{lv = 4, exp = 120},
						{lv = 5, exp = 216},						
						{lv = 6, exp = 288},
						{lv = 7, exp = 408},
						{lv = 8, exp = 504},
						{lv = 9, exp = 648},
						{lv = 10, exp = 888},
						{lv = 11, exp = 1164},
						{lv = 12, exp = 1488},
						{lv = 13, exp = 1848},
						{lv = 14, exp = 2244},
						{lv = 15, exp = 2340},
						{lv = 16, exp = 2448},
						{lv = 17, exp = 2568},
						{lv = 18, exp = 3048},
						{lv = 19, exp = 3708},
						{lv = 20, exp = 4116}}
		
function getEXP(input,lv)

	for i, _monstercom in monstercom do
		if lv == _monstercom.lv then
			for i, _v in _monstercom.explist do
				if input == _v.lv then
					return _v.exp
				end
			end
		end
	end
end

--��������Ҫ˵�Ļ�,�ӿ�ʼ�������������С�
--ĿǰǷȱ���Ǳ�����ɱ�����ж��Լ���Ӧ��ʾ

g_strNotice ={{group=1,nc1="���Ͽ�ʼ��",nc2="��1�ؿ�ʼ��"},
							{group=2,nc1="��1�ؽ�����", nc2="��2�ؿ�ʼ��"},
							{group=3,nc1="��2�ؽ�����", nc2="��3�ؿ�ʼ��"},
							{group=4,nc1="��3�ؽ�����", nc2="��4�ؿ�ʼ��"},
							{group=5,nc1="��4�ؽ�����", nc2="��5�ؿ�ʼ��"},
							{group=6,nc1="��5�ؽ�����", nc2="��6�ؿ�ʼ��"},
							{group=7,nc1="��6�ؽ�����", nc2="��7�ؿ�ʼ��"},
							{group=8,nc1="��7�ؽ�����", nc2="��8�ؿ�ʼ��"},
							{group=9,nc1="��8�ؽ�����", nc2="��9�ؿ�ʼ��"},
							{group=10,nc1="��9�ؽ�����", nc2="��10�ؿ�ʼ��"},
							{group=11,nc1="��10�ؽ�����", nc2="��11�ؿ�ʼ��"},
							{group=12,nc1="��11�ؽ�����", nc2="��12�ؿ�ʼ��"},
							{group=13,nc1="��12�ؽ�����", nc2="��13�ؿ�ʼ��"},
							{group=14,nc1="��13�ؽ�����", nc2="��14�ؿ�ʼ��"},
							{group=15,nc1="��14�ؽ�����", nc2="��15�ؿ�ʼ��"},
							{group=16,nc1="��15�ؽ�����", nc2="��16�ؿ�ʼ��"},
							{group=17,nc1="��16�ؽ�����", nc2="��17�ؿ�ʼ��"},
							{group=18,nc1="��17�ؽ�����", nc2="��18�ؿ�ʼ��"},
							{group=19,nc1="��18�ؽ�����", nc2="��19�ؿ�ʼ��"},
							{group=20,nc1="��19�ؽ�����", nc2="��20�ؿ�ʼ��"},
							{group=21,nc1="��20�ؽ�����", nc2="��ϲ����������ˣ�"}}

function getNC(group)

	for i,_str in g_strNotice do
		if group == _str.group then
		return _str.nc1, _str.nc2
		end
	end
end

--�����ǹ���ֲ����顣
							
monsterline1 ={{group = 1, monsterid = 200,num = 1},
							{group = 2, monsterid = 200,num = 2},
							{group = 3, monsterid = 200,num = 5},
							{group = 4, monsterid = 201,num = 1},
							{group = 5, monsterid = 201,num = 4},
							{group = 6, monsterid = 200,num = 3},
							{group = 6, monsterid = 202,num = 1},
							{group = 7, monsterid = 201,num = 2},
							{group = 7, monsterid = 202,num = 2},
							{group = 8, monsterid = 200,num = 3},
							{group = 8, monsterid = 201,num = 1},
							{group = 8, monsterid = 202,num = 1},
							{group = 9, monsterid = 202,num = 4},
							{group = 10, monsterid = 203,num = 5},
							{group = 11, monsterid = 203,num = 2},
							{group = 11, monsterid = 204,num = 3},
							{group = 12, monsterid = 204,num = 3},
							{group = 12, monsterid = 220,num = 2},
							{group = 13, monsterid = 220,num = 5},
							{group = 14, monsterid = 220,num = 2},
							{group = 14, monsterid = 221,num = 3},
							{group = 15, monsterid = 222,num = 1},
							{group = 16, monsterid = 223,num = 1},
							{group = 17, monsterid = 224,num = 1},
							{group = 18, monsterid = 220,num = 1},
							{group = 18, monsterid = 221,num = 1},
							{group = 18, monsterid = 222,num = 1},
							{group = 18, monsterid = 223,num = 1},
							{group = 18, monsterid = 224,num = 1},
							{group = 19, monsterid = 260,num = 5},
							{group = 20, monsterid = 280,num = 2}}
							
monsterline2 ={{group = 1, monsterid = 200,num = 1},
							{group = 2, monsterid = 200,num = 2},
							{group = 3, monsterid = 200,num = 5},
							{group = 4, monsterid = 201,num = 1},
							{group = 5, monsterid = 201,num = 4},
							{group = 6, monsterid = 200,num = 3},
							{group = 6, monsterid = 202,num = 1},
							{group = 7, monsterid = 201,num = 2},
							{group = 7, monsterid = 202,num = 2},
							{group = 8, monsterid = 200,num = 3},
							{group = 8, monsterid = 201,num = 1},
							{group = 8, monsterid = 202,num = 1},
							{group = 9, monsterid = 202,num = 4},
							{group = 10, monsterid = 203,num = 5},
							{group = 11, monsterid = 203,num = 2},
							{group = 11, monsterid = 204,num = 3},
							{group = 12, monsterid = 204,num = 3},
							{group = 12, monsterid = 220,num = 2},
							{group = 13, monsterid = 220,num = 5},
							{group = 14, monsterid = 220,num = 2},
							{group = 14, monsterid = 221,num = 3},
							{group = 15, monsterid = 222,num = 1},
							{group = 16, monsterid = 223,num = 1},
							{group = 17, monsterid = 224,num = 1},
							{group = 18, monsterid = 220,num = 1},
							{group = 18, monsterid = 221,num = 1},
							{group = 18, monsterid = 222,num = 1},
							{group = 18, monsterid = 223,num = 1},
							{group = 18, monsterid = 224,num = 1},
							{group = 19, monsterid = 260,num = 5},
							{group = 20, monsterid = 280,num = 2}}
							
monsterline3 ={{group = 1, monsterid = 200,num = 1},
							{group = 2, monsterid = 200,num = 2},
							{group = 3, monsterid = 200,num = 5},
							{group = 4, monsterid = 201,num = 1},
							{group = 5, monsterid = 201,num = 4},
							{group = 6, monsterid = 200,num = 3},
							{group = 6, monsterid = 202,num = 1},
							{group = 7, monsterid = 201,num = 2},
							{group = 7, monsterid = 202,num = 2},
							{group = 8, monsterid = 200,num = 3},
							{group = 8, monsterid = 201,num = 1},
							{group = 8, monsterid = 202,num = 1},
							{group = 9, monsterid = 202,num = 4},
							{group = 10, monsterid = 203,num = 5},
							{group = 11, monsterid = 203,num = 2},
							{group = 11, monsterid = 204,num = 3},
							{group = 12, monsterid = 204,num = 3},
							{group = 12, monsterid = 220,num = 2},
							{group = 13, monsterid = 220,num = 5},
							{group = 14, monsterid = 220,num = 2},
							{group = 14, monsterid = 221,num = 3},
							{group = 15, monsterid = 222,num = 1},
							{group = 16, monsterid = 223,num = 1},
							{group = 17, monsterid = 224,num = 1},
							{group = 18, monsterid = 220,num = 1},
							{group = 18, monsterid = 221,num = 1},
							{group = 18, monsterid = 222,num = 1},
							{group = 18, monsterid = 223,num = 1},
							{group = 18, monsterid = 224,num = 1},
							{group = 19, monsterid = 260,num = 5},
							{group = 20, monsterid = 280,num = 2}}
							
monsterline4 ={{group = 1, monsterid = 200,num = 1},
							{group = 2, monsterid = 200,num = 2},
							{group = 3, monsterid = 200,num = 5},
							{group = 4, monsterid = 201,num = 1},
							{group = 5, monsterid = 201,num = 4},
							{group = 6, monsterid = 200,num = 3},
							{group = 6, monsterid = 202,num = 1},
							{group = 7, monsterid = 201,num = 2},
							{group = 7, monsterid = 202,num = 2},
							{group = 8, monsterid = 200,num = 3},
							{group = 8, monsterid = 201,num = 1},
							{group = 8, monsterid = 202,num = 1},
							{group = 9, monsterid = 202,num = 4},
							{group = 10, monsterid = 203,num = 5},
							{group = 11, monsterid = 203,num = 2},
							{group = 11, monsterid = 204,num = 3},
							{group = 12, monsterid = 204,num = 3},
							{group = 12, monsterid = 220,num = 2},
							{group = 13, monsterid = 220,num = 5},
							{group = 14, monsterid = 220,num = 2},
							{group = 14, monsterid = 221,num = 3},
							{group = 15, monsterid = 222,num = 1},
							{group = 16, monsterid = 223,num = 1},
							{group = 17, monsterid = 224,num = 1},
							{group = 18, monsterid = 220,num = 1},
							{group = 18, monsterid = 221,num = 1},
							{group = 18, monsterid = 222,num = 1},
							{group = 18, monsterid = 223,num = 1},
							{group = 18, monsterid = 224,num = 1},
							{group = 19, monsterid = 260,num = 5},
							{group = 20, monsterid = 280,num = 2}}
							
monsterline5 ={{group = 1, monsterid = 200,num = 1},
							{group = 2, monsterid = 200,num = 2},
							{group = 3, monsterid = 200,num = 5},
							{group = 4, monsterid = 201,num = 1},
							{group = 5, monsterid = 201,num = 4},
							{group = 6, monsterid = 200,num = 3},
							{group = 6, monsterid = 202,num = 1},
							{group = 7, monsterid = 201,num = 2},
							{group = 7, monsterid = 202,num = 2},
							{group = 8, monsterid = 200,num = 3},
							{group = 8, monsterid = 201,num = 1},
							{group = 8, monsterid = 202,num = 1},
							{group = 9, monsterid = 202,num = 4},
							{group = 10, monsterid = 203,num = 5},
							{group = 11, monsterid = 203,num = 2},
							{group = 11, monsterid = 204,num = 3},
							{group = 12, monsterid = 204,num = 3},
							{group = 12, monsterid = 220,num = 2},
							{group = 13, monsterid = 220,num = 5},
							{group = 14, monsterid = 220,num = 2},
							{group = 14, monsterid = 221,num = 3},
							{group = 15, monsterid = 222,num = 1},
							{group = 16, monsterid = 223,num = 1},
							{group = 17, monsterid = 224,num = 1},
							{group = 18, monsterid = 220,num = 1},
							{group = 18, monsterid = 221,num = 1},
							{group = 18, monsterid = 222,num = 1},
							{group = 18, monsterid = 223,num = 1},
							{group = 18, monsterid = 224,num = 1},
							{group = 19, monsterid = 260,num = 5},
							{group = 20, monsterid = 280,num = 2}}							
							
monsterline6 ={{group = 1, monsterid = 200,num = 1},
							{group = 2, monsterid = 200,num = 2},
							{group = 3, monsterid = 200,num = 5},
							{group = 4, monsterid = 201,num = 1},
							{group = 5, monsterid = 201,num = 4},
							{group = 6, monsterid = 200,num = 3},
							{group = 6, monsterid = 202,num = 1},
							{group = 7, monsterid = 201,num = 2},
							{group = 7, monsterid = 202,num = 2},
							{group = 8, monsterid = 200,num = 3},
							{group = 8, monsterid = 201,num = 1},
							{group = 8, monsterid = 202,num = 1},
							{group = 9, monsterid = 202,num = 4},
							{group = 10, monsterid = 203,num = 5},
							{group = 11, monsterid = 203,num = 2},
							{group = 11, monsterid = 204,num = 3},
							{group = 12, monsterid = 204,num = 3},
							{group = 12, monsterid = 220,num = 2},
							{group = 13, monsterid = 220,num = 5},
							{group = 14, monsterid = 220,num = 2},
							{group = 14, monsterid = 221,num = 3},
							{group = 15, monsterid = 222,num = 1},
							{group = 16, monsterid = 223,num = 1},
							{group = 17, monsterid = 224,num = 1},
							{group = 18, monsterid = 220,num = 1},
							{group = 18, monsterid = 221,num = 1},
							{group = 18, monsterid = 222,num = 1},
							{group = 18, monsterid = 223,num = 1},
							{group = 18, monsterid = 224,num = 1},
							{group = 19, monsterid = 260,num = 5},
							{group = 20, monsterid = 280,num = 2}}
							
monsterline7 ={{group = 1, monsterid = 200,num = 1},
							{group = 2, monsterid = 200,num = 2},
							{group = 3, monsterid = 200,num = 5},
							{group = 4, monsterid = 201,num = 1},
							{group = 5, monsterid = 201,num = 4},
							{group = 6, monsterid = 200,num = 3},
							{group = 6, monsterid = 202,num = 1},
							{group = 7, monsterid = 201,num = 2},
							{group = 7, monsterid = 202,num = 2},
							{group = 8, monsterid = 200,num = 3},
							{group = 8, monsterid = 201,num = 1},
							{group = 8, monsterid = 202,num = 1},
							{group = 9, monsterid = 202,num = 4},
							{group = 10, monsterid = 203,num = 5},
							{group = 11, monsterid = 203,num = 2},
							{group = 11, monsterid = 204,num = 3},
							{group = 12, monsterid = 204,num = 3},
							{group = 12, monsterid = 220,num = 2},
							{group = 13, monsterid = 220,num = 5},
							{group = 14, monsterid = 220,num = 2},
							{group = 14, monsterid = 221,num = 3},
							{group = 15, monsterid = 222,num = 1},
							{group = 16, monsterid = 223,num = 1},
							{group = 17, monsterid = 224,num = 1},
							{group = 18, monsterid = 220,num = 1},
							{group = 18, monsterid = 221,num = 1},
							{group = 18, monsterid = 222,num = 1},
							{group = 18, monsterid = 223,num = 1},
							{group = 18, monsterid = 224,num = 1},
							{group = 19, monsterid = 260,num = 5},
							{group = 20, monsterid = 280,num = 2}}							
							
monsterline8 ={{group = 1, monsterid = 200,num = 1},
							{group = 2, monsterid = 200,num = 2},
							{group = 3, monsterid = 200,num = 5},
							{group = 4, monsterid = 201,num = 1},
							{group = 5, monsterid = 201,num = 4},
							{group = 6, monsterid = 200,num = 3},
							{group = 6, monsterid = 202,num = 1},
							{group = 7, monsterid = 201,num = 2},
							{group = 7, monsterid = 202,num = 2},
							{group = 8, monsterid = 200,num = 3},
							{group = 8, monsterid = 201,num = 1},
							{group = 8, monsterid = 202,num = 1},
							{group = 9, monsterid = 202,num = 4},
							{group = 10, monsterid = 203,num = 5},
							{group = 11, monsterid = 203,num = 2},
							{group = 11, monsterid = 204,num = 3},
							{group = 12, monsterid = 204,num = 3},
							{group = 12, monsterid = 220,num = 2},
							{group = 13, monsterid = 220,num = 5},
							{group = 14, monsterid = 220,num = 2},
							{group = 14, monsterid = 221,num = 3},
							{group = 15, monsterid = 222,num = 1},
							{group = 16, monsterid = 223,num = 1},
							{group = 17, monsterid = 224,num = 1},
							{group = 18, monsterid = 220,num = 1},
							{group = 18, monsterid = 221,num = 1},
							{group = 18, monsterid = 222,num = 1},
							{group = 18, monsterid = 223,num = 1},
							{group = 18, monsterid = 224,num = 1},
							{group = 19, monsterid = 260,num = 5},
							{group = 20, monsterid = 280,num = 2}}

--������˵���������ҵȼ������ĸ��ȼ��Σ���ô��ƥ���Բ�ͬ��monlist(�����б�����)���Ͳ�ͬ��explist(���齱���б�)

monstercom = {{lv=1,monlist=monsterline1,explist=explist1},
							{lv=2,monlist=monsterline2,explist=explist2},
							{lv=3,monlist=monsterline3,explist=explist3},
							{lv=4,monlist=monsterline4,explist=explist4},
							{lv=5,monlist=monsterline5,explist=explist5},
							{lv=6,monlist=monsterline6,explist=explist6},
							{lv=7,monlist=monsterline7,explist=explist7},
							{lv=8,monlist=monsterline8,explist=explist8}}
							
function getMonsterCount(group,lv)

CountNum = 0

	for i,_monstercom in monstercom do
		if lv == _monstercom.lv then
			for i, _monsterline in _monstercom.monlist do
				if group == _monsterline.group then
					CountNum = CountNum + _monsterline.num
				end
			end
		end
	end
		return CountNum

end

function exchangeDayCount(data)
	local misCount = floor(data / 100000)
	return misCount, mod(data, 100000)
end

function exchangeDCData(misCount, misDate)
	return misCount * 100000 + misDate
end

misMaxTime = {{week = '0', maxTime = 3},
							{week = '1', maxTime = 3},
							{week = '2', maxTime = 3},
							{week = '3', maxTime = 5},
							{week = '4', maxTime = 3},
							{week = '5', maxTime = 3},
							{week = '6', maxTime = 3}}

function getMissionMaxTime()
	for i, _misMT in misMaxTime do
		if date("%w") == _misMT.week then
			return _misMT.maxTime
		end
	end
end
--MisD11escEnd

--**********************************

--������ں���

--**********************************

function x700000_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	misIndex = GetMissionIndexByID(sceneId,selfId,x700000_g_MissionId)
	
	if IsHaveMission(sceneId,selfId,x700000_g_MissionId) > 0 then

		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x700000_g_MissionName)
			if (GetName(sceneId,targetId)==x700000_g_Name) then
				AddText(sceneId,x700000_g_ContinueInfo)
			else
				AddText(sceneId,x700000_g_TargetContinueInfo)
			end
		EndEvent()

		bDone = 1--x700000_CheckSubmit( sceneId, selfId, targetId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x700000_g_ScriptId,x700000_g_MissionId)
		--DispatchMissionDemandInfo(sceneId,selfId,targetId,x700000_g_ScriptId,x700000_g_MissionId,bDone)
	--���������������

	elseif GetMissionData(sceneId, selfId, MD_MONSTERPARTY_STATE) == 1 then

		--�����������ʱ��ʾ����Ϣ

		BeginEvent(sceneId)

			AddText(sceneId,x700000_g_MissionName)

			AddText(sceneId,x700000_g_MissionInfo)

			AddText(sceneId,"#{M_MUBIAO}")

			AddText(sceneId,x700000_g_MissionTarget)

		EndEvent( )

		DispatchMissionInfo(sceneId,selfId,targetId,x700000_g_ScriptId,x700000_g_MissionId)

	elseif GetMissionData(sceneId, selfId, MD_MONSTERPARTY_STATE) == 0 then
		if HaveItem(sceneId, selfId, 30001001) or GetMoney(sceneId, selfId) >= 5 then
		
			BeginEvent(sceneId)

			AddText(sceneId,x700000_g_MissionName)

			AddText(sceneId,x700000_g_MissionInfo.."��Ҫ�۳����߻��Ǯ������������")

			AddText(sceneId,"#{M_MUBIAO}")

			AddText(sceneId,x700000_g_MissionTarget)

			EndEvent( )

			DispatchMissionInfo(sceneId,selfId,targetId,x700000_g_ScriptId,x700000_g_MissionId)
		end
	else
		
		BeginEvent(sceneId)

		AddText(sceneId,"�ﵽ����")

		EndEvent( )

		DispatchMissionInfo(sceneId,selfId,targetId,x700000_g_ScriptId,x700000_g_MissionId)
	end


end



--**********************************

--�о��¼�

--**********************************

function x700000_OnEnumerate( sceneId, selfId, targetId )
	    --��������ɹ��������

	    --����ѽӴ�����
	    --else
	  if IsHaveMission(sceneId,selfId,x700000_g_MissionId) > 0 then
			
				AddNumText(sceneId,x700000_g_ScriptId,x700000_g_MissionName);
	
	    --���������������
	
	  elseif x700000_CheckAccept(sceneId,selfId,targetId) > 0 then
	
			AddNumText(sceneId,x700000_g_ScriptId,x700000_g_MissionName);
	
	  end
end



--**********************************

--����������

--**********************************

function x700000_CheckAccept( sceneId, selfId,targetId )
	--��Ҫ10�����ܽ�

    local normalState = 0
	if GetLevel( sceneId, selfId ) >= 10 then

	    local nowDay = GetDayTime()
	    local misData = GetMissionData(sceneId, selfId, MD_MONSTERPARTY_DAYCOUNT)
	    local preCount, preDay = exchangeDayCount(misData)
	    
	    if preDay ~= nowDay then
	    	preCount = 0
		   	SetMissionData(sceneId,selfId,MD_MONSTERPARTY_DAYCOUNT,exchangeDCData(preCount, nowDay))
		   	normalState = 1
		  elseif preCount == 0 then
		  	normalState = 1
	    else
--	   	 if preCount >= getMissionMaxTime() then

--	   	 	normalState = -1
--	   	 else
	   	 	normalState = 0
--	   	 end
			end
	else
			return 0
	end
	SetMissionData(sceneId,selfId,MD_MONSTERPARTY_STATE,normalState)
	
	return normalState+1
end



--**********************************

--����

--**********************************

function x700000_OnAccept( sceneId, selfId )

	--������������б�
	if GetMissionData(sceneId,selfId,MD_MONSTERPARTY_STATE) < 0 then
		return
	elseif GetMissionData(sceneId,selfId,MD_MONSTERPARTY_STATE) == 0 then
		if HaveItem(sceneId, selfId, 30001001) > 0 then
			DelItem(sceneId,selfId,30001001,1)
			
			BeginEvent(sceneId)
			AddText(sceneId,"�۳�СѪƿ1��1��")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			
		elseif GetMoney(sceneId,selfId) >= 5 then
			local bDone = CostMoney(sceneId, selfId, 5)

			BeginEvent(sceneId)
			AddText(sceneId,"�۳����5��")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			
		else
			BeginEvent(sceneId)
			AddText(sceneId,"��ʲô��û�У�")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			return
		end
	end

	AddMission( sceneId,selfId, x700000_g_MissionId, x700000_g_ScriptId, 1, 0, 0 )		--�������
	misIndex = GetMissionIndexByID(sceneId,selfId,x700000_g_MissionId)
				--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)						--�������кŰ���������ĵ�0λ��0 ���Ǽ�¼����Ѿ���ɵĹؿ��� v
--	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0 ���Ǽ�¼��ҿɷ���������
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)						--ɱ����
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)						--�ȼ���lv

--	NewWorld( sceneId, selfId, copysceneid, x700000_g_Fuben_X, x700000_g_Fuben_Z)
	x700000_MakeCopyScene( sceneId, selfId)

	
--�Ҳ��� ����˵��ʾ�Ĳ���

	BeginEvent(sceneId)
		AddText(sceneId, getNC(1))
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)

end

function x700000_OnHumanDie(sceneId,selfId,killerId)
			BeginEvent(sceneId)
			AddText(sceneId,"���������ˣ����������ȥ����ľ����ȡ�����ɣ�")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			
			misIndex = GetMissionIndexByID(sceneId,selfId,x700000_g_MissionId)			
	for i,_monsterline in monstercom[GetMissionParam(sceneId,selfId,misIndex,3)].monlist do
		if GetMissionParam(sceneId,selfId,misIndex,0) == _monsterline.group then
		

			--LuaFnDeleteMonster(sceneId, _monsterline.monsterid)
		end
	end
end

function x700000_OnDie( sceneId, killerId , selfId)
--print(selfId)
	--RemoveMonster(sceneId,killerId)
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x700000_g_MissionId)
	local killmonster = GetMissionParam(sceneId,selfId,misIndex,2)
	local killmonster = killmonster + 1
	local group = GetMissionParam(sceneId,selfId,misIndex,0)
--	Param(sceneId,selfId,misIndex,0)

				lv = GetMissionParam(sceneId,selfId,misIndex,3)
	if getMonsterCount(group,lv) == killmonster then
			group = group + 1
			local nowTickCount = LuaFnGetCopySceneData_Param(sceneId, 2);
			LuaFnSetCopySceneData_Param(sceneId, 7, nowTickCount) ;--
			SetMissionByIndex(sceneId,selfId,misIndex,0,group)
			SetMissionByIndex(sceneId,selfId,misIndex,2,0)
			if group > 20 then
				local oldscene = LuaFnGetCopySceneData_Param(sceneId, 3)
				NewWorld( sceneId, selfId, oldscene, x700000_g_Back_X, x700000_g_Back_Z )
				
			end
	else
		SetMissionByIndex(sceneId,selfId,misIndex,2,killmonster)
	end
				local nc1,nc2 = getNC(group)
				BeginEvent(sceneId)
				
					AddText(sceneId,nc1)
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				
				BeginEvent(sceneId)
				
					AddText(sceneId,nc2)
				EndEvent()
				DispatchMissionTips(sceneId, selfId)

end



--**********************************

--����

--**********************************

function x700000_OnAbandon( sceneId, selfId )

	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x700000_g_MissionId )
end



--**********************************

--����

--**********************************

function x700000_OnContinue( sceneId, selfId, targetId )

	--�ύ����ʱ��˵����Ϣ

	BeginEvent(sceneId)
		AddText(sceneId,x700000_g_MissionName)
		AddText(sceneId,x700000_g_MissionComplete)
	EndEvent( )

   DispatchMissionContinueInfo(sceneId,selfId,targetId,x700000_g_ScriptId,x700000_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x700000_CheckSubmit( sceneId, selfId, targetId)


	return 1
--	if num>0	then
--		return 1
--	end
	
--	return 0

end


--**********************************

--�ύ

--**********************************

function x700000_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if x700000_CheckSubmit( sceneId, selfId, targetId)>0 then

		misIndex = GetMissionIndexByID(sceneId,selfId,x700000_g_MissionId)
		k = GetMissionParam(sceneId,selfId,misIndex,0)
		lv = GetMissionParam(sceneId,selfId,misIndex,3)
		AddExp(sceneId,selfId,getEXP(k-1,lv))
--		SetMissionByIndex(sceneId,selfId,misIndex,1,100)
		DelMission(sceneId, selfId, x700000_g_MissionId)
	end

end



--**********************************

--ɱ����������

--**********************************

function x700000_OnKillObject( sceneId, selfId, objdataId, objId )
	
--	local killedId = LuaFnGetTargetObjID(sceneId,objdataId)
--	for i,_monsterline in monstercom[lv].monlist do
--		if group == _monsterline.group then
--			for j = 1, _monsterline.num do
--				return _monsterline.monsterid
--			end
--		end
--		RemoveMonster(sceneId,_monsterline.monsterid)
	RemoveMonster(sceneId,objId)
--	end
end



--**********************************

--���������¼�

--**********************************

function x700000_OnEnterArea( sceneId, selfId, zoneId )

end



--**********************************

--���߸ı�

--**********************************

function x700000_OnItemChanged( sceneId, selfId, itemdataId )

end


function x700000_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--���ø�����ڳ�����
	selfguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	selfId = LuaFnGuid2ObjId(sceneId,selfguid);
	--ȡ����Ҹ����Ķ��������������Լ���
--	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
--	local mems = {}
--	for	i=0,nearteammembercount-1 do
--		selfId = GetNearTeamMember(sceneId, leaderObjId, i)
--		misIndex = GetMissionIndexByID(sceneId,selfId,x700000_g_MissionId)
		
		--������ĵ�2����������Ϊ�����ĳ�����
--		SetMissionByIndex(sceneId,selfId,misIndex,x700000_g_Param_sceneid,destsceneId)
				
		NewWorld( sceneId, selfId, destsceneId, x700000_g_Fuben_X, x700000_g_Fuben_Z) ;






end


function x700000_OnCopySceneTimer( sceneId, nowTime )

	selfguid  = LuaFnGetCopySceneData_TeamLeader(sceneId) ;	
	selfId = LuaFnGuid2ObjId(sceneId,selfguid);
	--����ʱ�Ӷ�ȡ������
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--�����µĶ�ʱ�����ô���

		
	local curTickCount = LuaFnGetCopySceneData_Param(sceneId, 7);		--ȡ���Ѿ�ִ�еĶ�ʱ����
	
	--�����رձ�־
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	
	if leaveFlag == 1 then --��Ҫ�뿪
		
		--�뿪����ʱ��Ķ�ȡ������
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;
		
			if leaveTickCount == x700000_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��
			
				oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
					NewWorld( sceneId, selfId, oldsceneId, x700000_g_Back_X, x700000_g_Back_Z )
				
			elseif leaveTickCount < x700000_g_CloseTick then
			
				oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
	
				--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
				local remainTime = x700000_g_CloseTick-leaveTickCount*x700000_g_TickTime;
				if remainTime < 60 then
		  			BeginEvent(sceneId)
		  				strText = format("�㽫��%d����뿪����!", remainTime )
		  				AddText(sceneId,strText);
		  			EndEvent(sceneId)
		  			DispatchMissionTips(sceneId,selfId)
		  	end
			end

	elseif TickCount == x700000_g_LimitTimeSuccess then
		--�˴�������ʱ�����Ƶ�������ɴ���
  			BeginEvent(sceneId)
  				AddText(sceneId,"����ʱ�䵽�����!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,selfId)
  			
			misIndex = GetMissionIndexByID(sceneId,selfId,x700000_g_MissionId)--ȡ��������������ֵ
			--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
			SetMissionByIndex(sceneId,selfId,misIndex,x700000_g_Param_ok,1)--������������
			--��ɸ�������ʱ��
			SetMissionByIndex(sceneId,selfId,misIndex,x700000_g_Param_time,TickCount*x700000_g_TickTime)--������������
--	end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	elseif TickCount == x700000_g_LimitTotalHoldTime then --������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
			DelMission( sceneId, selfId, x700000_g_MissionId );--����ʧ��,ɾ��֮

  			BeginEvent(sceneId)
  				AddText(sceneId,"����ʧ�ܣ���ʱ!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,selfId)
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		

	if curTickCount == LuaFnGetCopySceneData_Param(sceneId, 2) - 2 then
	
--�����ǻ�ȡ��ȼ������Ҹ�����ȼ��������Ϊ��ͬ�Ľ׶�
--10��29��Ϊ��һ�Σ��������ƣ�150������Ϊһ�Σ�����8��

	playerlevel = GetLevel(sceneId,selfId)
	local lv = 0
	if playerlevel >= 10 and playerlevel < 30 then
		lv = 1
	elseif playerlevel >= 30 and playerlevel < 50 then
		lv = 2
	elseif playerlevel >= 50 and playerlevel < 70 then
		lv = 3
	elseif playerlevel >= 70 and playerlevel < 90 then
		lv = 4
	elseif playerlevel >= 90 and playerlevel < 110 then
		lv = 5	
	elseif playerlevel >= 110 and playerlevel < 130 then
		lv = 6	
	elseif playerlevel >= 130 and playerlevel < 150 then
		lv = 7	
	elseif playerlevel >= 150 then
		lv = 8	
	end
--	misIndex = GetMissionParam(sceneId,selfId,misIndex,3)				--GetMissionIndexByID(sceneId,selfId,x700000_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,3,lv)

	group = GetMissionParam(sceneId,selfId,misIndex,0)

	--LuaFnCreateMonster(sceneId,1000,26,217,0,109,900019)
	--LuaFnCreateMonster(sceneId,1000,20,218,0,109,900019)

	if group < 21 then
		for i,_monsterline in monstercom[lv].monlist do
			if group == _monsterline.group then
				for j = 1, _monsterline.num do
					local p = LuaFnCreateMonster(sceneId,_monsterline.monsterid,5,4,0,109,700000)
				end
			end
		end
	end

	local preCount, preDay = exchangeDayCount(GetMissionData(sceneId, selfId, MD_MONSTERPARTY_DAYCOUNT))
	SetMissionData(sceneId, selfId, MD_MONSTERPARTY_DAYCOUNT, exchangeDCData(preCount+1, preDay))

end



end

--��ʼ��������	
function x700000_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "Fuben_MonsterParty/0.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x700000_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x700000_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x700000_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x700000_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
--	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	local nowTickCount = LuaFnGetCopySceneData_Param(sceneId, 2);
	LuaFnSetCopySceneData_Param(sceneId, 7, nowTickCount) ;--


	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
			--ɾ����������б��ж�Ӧ������
			DelMission( sceneId, selfId, x700000_g_MissionId )
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

function x700000_OnEnterZone( sceneId, selfId, zoneId )
end

function x700000_OnPlayerEnter( sceneId, selfId )
	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x700000_g_Fuben_X, x700000_g_Fuben_Z );
end