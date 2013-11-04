--Ӫ��С��ʿ

--MisDescBegin
x207017_g_ScriptId = 207017
x207017_g_MissionIdPre =15
x207017_g_MissionId = 18
x207017_g_MissionKind = 1
x207017_g_ScriptIdNext = {ScriptId = 207018 ,LV = 1 }
x207017_g_Name	="������" 
x207017_g_Name2	="С��ʿ" 

x207017_g_MissionName="Ӫ��С��ʿ"
x207017_g_MissionInfo="    ��#G���˺�#W�����˽������ģ������ᣬ����Ū��ѧ�����ˣ�\n \n    ��������̫�󣬶��ҽƻ��ĺܣ����ǵ����߼��ζ��������ˡ�������ô���㶼�벻�����������ڻ�ױ��ʲô���ӣ�����������˵����һ����Ц���ˣ��������š���\n \n    ���õ�һ��������Ϊ�������������Լ��ĺ������ˣ���Ȼ��װ��һ���ָ��ˣ���������Ϊ�������Ϣ�����ǵ��ֵܱ�#R���ܵĽ��#W��ץס�ˡ�\n \n    ������ܰ����ȳ�����˵������֪����ʲô������һ��#GС��ʿ#W������Ѻ�ڣ�xxx��xxx���� "  --��������
x207017_g_MissionTarget="    �ҵ�����Ѻ��#GС��ʿ#W"		
x207017_g_MissionComplete="    ��Щ����������ܣ�ɽ����Ի��������������ˡ����������������������٣������һ�μ������ںڷ��һ��,����һ#G��������#W��һ�𣬸�����һȺ������ߵ��˰��б����ţ����ҪС�İ���"					--�������npc˵���Ļ�
--������
x207017_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x207017_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207017_g_RadioItemBonus={}

--MisDescEnd


--**********************************

--������ں���

--**********************************

function x207017_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207017_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207017_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x207017_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207017_g_MissionName)
			AddText(sceneId,x207017_g_MissionComplete)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207017_g_MissionTarget) 
			AddMoneyBonus(sceneId, x207017_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x207017_g_ScriptId, x207017_g_MissionId)
		end
        elseif x207017_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207017_g_MissionName)
                AddText(sceneId,x207017_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207017_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207017_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207017_g_ScriptId, x207017_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207017_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207017_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207017_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207017_g_ScriptId, x207017_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207017_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x207017_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207017_CheckPushList(sceneId, selfId, targetId)
	if IsMissionHaveDone(sceneId, selfId, x207017_g_MissionIdPre) > 0 then
        	if (GetName(sceneId,targetId)==x207017_g_Name) then
                	if IsHaveMission(sceneId,selfId, x207017_g_MissionId)<= 0 then
                   	 return 1
                	end
        	end
		if (GetName(sceneId,targetId)==x207017_g_Name2) then
		    	if IsHaveMission(sceneId,selfId, x207017_g_MissionId) > 0 then
		    	return 1
                    	end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x207017_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207017_g_MissionId, x207017_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x207017_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x207017_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207017_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207017_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207017_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207017_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207017_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207017_g_MissionId)
		AddExp(sceneId, selfId, x207017_g_ExpBonus)
		AddMoney(sceneId, selfId, x207017_g_MoneyBonus)
		
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x207017_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x207017_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207017_OnItemChanged(sceneId, selfId, itemdataId)

end

