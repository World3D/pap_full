--����������

--MisDescBegin
x207000_g_ScriptId = 207000
x207000_g_MissionIdPre =1
x207000_g_MissionId = 1
x207000_g_MissionKind = 1
x207000_g_ScriptIdNext = {ScriptId = 207001 ,LV = 1 }
x207000_g_Name	="�����" 
x207000_g_Name2	="�ٲ�̨" 

x207000_g_MissionName="����������"
x207000_g_MissionInfo="���ܸ��˼����㣬�������ܰ��ҽ����������ʣ�����ǧ���Ե�������˵����������ԶԳ����췢�ĵĻ�����������������Ŀ��˿����ܣ��������������˵��\n \n    �����ڶ�İ���ʬ����������ս��Ʒ��ʱ��һ��ʬ����������������������塣���������͸��������ϸ�壬�����ף����ϴ���֬�У������㣬ֻ���½�����ɽ���Ų��ĺ��ٰ��񡭡��������ţ�������һ��Ů�˵���ζ��\n \n    #G�ٲ�̨#W�����ǵ�һ������������Ұ����ģ����ĵ��������������һ�����������������ۣ����ϵ���ɱ�˵��ֶΣ��������ܲ�һ�������꣡���꣡��\n \n�����������һ���ǳ���#G�ٲ�̨#W�ĵ������꣬�����������������ʬ������飬��Ϊ�Ҹо����������ڿ������ƺ���һ��Ů���йء�"  --��������
x207000_g_MissionTarget="    ѯ��#G�ٲ�̨#W�����������������"		
x207000_g_MissionComplete="    �����ڸ���˵������û�����㡭��!\n \n    �찡����������ô��������ߴߴ���ᣬ�ͺ���������һֻ��Ӭ���ˡ����Բ��𣬲���һֻ����һ�Ѳ�ӬΧ���㣬�ˡ��ˡ��ˡ��ˡ��ɵ��������棬�Һ޲��ð���һ�������ˣ�"					--�������npc˵���Ļ�
--������
--��Ǯ����
x207000_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207000_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207000_g_RadioItemBonus={}

--MisDescEnd


--**********************************

--������ں���

--**********************************

function x207000_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207000_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207000_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207000_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207000_g_MissionName)
			AddText(sceneId,x207000_g_MissionComplete)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207000_g_MissionTarget) 
			AddMoneyBonus(sceneId, x207000_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x207000_g_ScriptId, x207000_g_MissionId)
		end
        elseif x207000_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207000_g_MissionName)
                AddText(sceneId,"    "..GetName(sceneId, selfId)..x207000_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207000_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207000_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207000_g_ScriptId, x207000_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207000_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207000_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207000_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207000_g_ScriptId, x207000_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207000_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207000_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207000_CheckPushList(sceneId, selfId, targetId)
        if (GetName(sceneId,targetId)==x207000_g_Name) then
                if IsHaveMission(sceneId,selfId, x207000_g_MissionId)<= 0 then
                    return 1
                end
        end
	if (GetName(sceneId,targetId)==x207000_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x207000_g_MissionId) > 0 then
		    return 1
                    end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207000_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207000_g_MissionId, x207000_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207000_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207000_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207000_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207000_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207000_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207000_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207000_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207000_g_MissionId)
		AddExp(sceneId, selfId, x207000_g_ExpBonus)
		AddMoney(sceneId, selfId, x207000_g_MoneyBonus)
		for i, item in pairs(x207000_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        CallScriptFunction( x207000_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207000_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207000_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207000_OnItemChanged(sceneId, selfId, itemdataId)

end

